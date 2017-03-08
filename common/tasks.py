#-*- coding: UTF-8 -*-
import os
from celery import task
from urllib.request import urlopen
import django
from django.template.context import RequestContext
import datetime
import time

from model.models import *
from common.myRtree import *
from common.Netcat import *

from django.contrib.auth import get_user_model
django.setup()#不加这个会出错，models aren't loaded yet
User = get_user_model()

from django.core import serializers#objects 转化为 json

import logging
import traceback
logger_rtree = logging.getLogger('frontend.views.alljob.rtree')
logger_alljob = logging.getLogger('frontend.views.alljob.alljob')
logger_view_details = logging.getLogger('frontend.views.alljob.view_details')
logger_permissions = logging.getLogger('permissions')
@task
def uav_flying_status_detector():
#更改UAV的状态
    time_delta = datetime.timedelta(seconds = 300)#相差5min，更改
    time_now = datetime.datetime.now()#取当前时间
    msg = ""
    try:
        uav = UAV.objects.filter(is_flying=True)
        for u in uav:
            time_uav = u.time
            if (time_now - time_uav.replace(tzinfo=None)) > time_delta:#如果相差超过5min
                u.is_flying = False#表示该uav已有5min没有数据写入
                u.save()#则把飞行标识置false
        msg = "successed"
    except:
        msg = "failed"
    return msg

@task
def lat_lng_converter():
#UAV_Job_Desc百度坐标转换
    try:
        job_desc = UAV_Job_Desc.objects.filter(lng=0)
        for x in job_desc:
            lng = x.longitude
            lat = x.latitude
            if not lng or not lat:
                continue 
            u = urlopen("http://api.map.baidu.com/geoconv/v1/?coords=%s,%s&from=1&to=5&ak=upTvjM7vTHHlXckl6gxFkndl"%(lng,lat))
            baidu_s = eval(u.read())
            #status:0_表示正常，其他表示异常
            if baidu_s['status']:#如果异常，重新获取
                time.sleep(100)
                u = urlopen("http://api.map.baidu.com/geoconv/v1/?coords=%s,%s&from=1&to=5&ak=upTvjM7vTHHlXckl6gxFkndl"%(lng,lat))
                baidu_s = eval(u.read())
            x.lng = baidu_s['result'][0]['x']
            x.lat = baidu_s['result'][0]['y']
            x.save()
        return "DONE"
    except:
        return "Error"

@task
def Job_Border_to_Rtree():
#所有符合条件的Job_Border插入Rtree
    try:
        idx = myRtree_overwrite()
        jobs = Job.objects.exclude(status=2)
        for job in jobs:
            job_border = Job_Border.objects.filter(job_id=job.id)
            if len(job_border) > 0:
                lng_max = 0
                lng_min = 180
                lat_max = 0
                lat_min = 90
                for i in job_border:
                    if i.lng > lng_max:
                        lng_max = i.lng
                    if i.lng < lng_min:
                        lng_min = i.lng
                    if i.lat > lat_max:
                        lat_max = i.lat
                    if i.lat < lat_min:
                        lat_min = i.lat
                #left, bottom, right, top
                idx.insert(id=job.id,coordinates=(lng_min, lat_min, lng_max, lat_max),obj=job.id)
        return "Job_Border_to_Rtree successed"        
    except:
        return "Job_Border_to_Rtree Error"

@task
def Job_Border_to_Rtree_single(job_id):
#插入的Job_Border同时插入Rtree
    try:
        idx = myRtree()
        job_border = Job_Border.objects.filter(job_id=job_id)
        lng_max = 0
        lng_min = 180
        lat_max = 0
        lat_min = 90
        for i in job_border:
            if i.lng > lng_max:
                lng_max = i.lng
            if i.lng < lng_min:
                lng_min = i.lng
            if i.lat > lat_max:
                lat_max = i.lat
            if i.lat < lat_min:
                lat_min = i.lat
        #left, bottom, right, top
        idx.insert(id=job_id,coordinates=(lng_min, lat_min, lng_max, lat_max),obj=job_id)
        return "Job_Border_to_Rtree_single successed" 
    except:
        return "Job_Border_to_Rtree_single Error"

@task
def All_Job_Rtree_Logger(user,lng,lat):
#R树查询LOGGER
    try:
        if user:
            u = urlopen("http://api.map.baidu.com/geocoder/v2/?ak=upTvjM7vTHHlXckl6gxFkndl&callback=renderReverse&location=%s,%s&output=json&pois=1"%(lat,lng))
            baidu_s = eval(u.read()[29:-1])
            #status:0_表示正常，其他表示异常
            for i in range(3):
                if baidu_s['status']:#如果异常，重新获取
                    time.sleep(100)
                    u = urlopen("http://api.map.baidu.com/geocoder/v2/?ak=upTvjM7vTHHlXckl6gxFkndl&callback=renderReverse&location=%s,%s&output=json&pois=1"%(lat,lng))
                    baidu_s = eval(u.read()[29:-1])
                else:
                    break
            code = baidu_s['result']['addressComponent']['adcode']
            logger_rtree.info('\n'+__name__+','+user.username
                +',Check Alljob Rtree Successed.'
                +'{ID:'+str(user.id)+',lng:'+str(lng)
                +',lat:'+str(lat)+',code:'+str(code)+'}')
            return "DONE"
    except:
        logger_rtree.error('\n'+__name__+','+user.username
            +',Check Alljob Rtree Failed.'
            +'\n%s' % traceback.format_exc())
        return "Error"

@task
def All_Job_Logger(nowuser,province='',city='',district='',code=''):
#行政区划查询LOGGER
    if district != '':
        logger_alljob.info('\n'+__name__+','+nowuser.username
            +',Checked Alljobs in 3.{ID:'+str(nowuser.id)
            +',province:'+str(province)
            +',city:'+str(city)
            +',district:'+str(district)
            +',code:'+str(code)+'}')
    elif city != '':
        logger_alljob.info('\n'+__name__+','+nowuser.username
            +',Checked Alljobs in 2.{ID:'+str(nowuser.id)
            +',province:'+str(province)
            +',city:'+str(city)
            +',code:'+str(code)+'}')
    elif province != '':
        logger_alljob.info('\n'+__name__+','+nowuser.username
            +',Checked Alljobs in 1.{ID:'+str(nowuser.id)
            +',province:'+str(province)
            +',code:'+str(code)+'}')

@task
def All_Job_View_Details(nowuser,job):
    logger_view_details.info('\n'+__name__+','+nowuser.username
            +',View a Job Details.{ID:'+str(nowuser.id)
            +',job_id:'+str(job.id)
            +',job_number:'+str(job.number)
            +',job_type_id:'+str(job.job_type_id)
            +',farm_type_id:'+str(job.farm_type_id)
            +',each_pay:'+str(job.each_pay)
            +',code:'+str(job.nation)+'}')

