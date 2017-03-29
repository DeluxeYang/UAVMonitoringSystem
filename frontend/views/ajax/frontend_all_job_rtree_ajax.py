#-*- coding: UTF-8 -*-   
import datetime
from django.http import JsonResponse
from model.models import *
from common.myRtree import *
from common.tasks import *
from django.core import serializers#objects 转化为 json
from django.http import HttpResponse, HttpResponseRedirect  
# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
import json
import logging
import traceback
logger_rtree = logging.getLogger('frontend.views.alljob.rtree')
logger_permissions = logging.getLogger('permissions')
@csrf_exempt

def frontend_all_job_rtree_ajax(request):
    nowuser = request.user
    try:
        data = request.GET.get("data",None)
        json_data = json.loads(data)
        lng_max = json_data['lng_max']
        lng_min = json_data['lng_min']
        lat_max = json_data['lat_max']
        lat_min = json_data['lat_min']
        idx = myRtree()
        #left, bottom, right, top
        if not idx:
            return HttpResponse("kong")
        job_list = idx.intersection((lng_min, lat_min, lng_max, lat_max))
        j = {}
        temp = {}
        temp_temp = {}
        count = 0
        for i in job_list:
            try:
                job = Job.objects.get(id=i)
            except Job.DoesNotExist:
                continue
            job_border = Job_Border.objects.filter(job_id=job.id)
            num = 0
            temp_temp = {}
            for x in job_border:
                #return HttpResponse('lng'+str(x.lng)+'lat'+str(x.lat))
                temp_temp[num] = {'lng':x.lng,'lat':x.lat}
                num += 1
            district = Nation.objects.get(code=job.nation)
            city = Nation.objects.get(id=district.parent)
            province = Nation.objects.get(id=city.parent)
            temp = {'job_border':temp_temp,'job_border_length':num,'number':job.number,'id':job.id,'username':job.user.username,'status':job.status,'job_type':job.job_type.type,'farm_type':job.farm_type.type,'start_time':job.start_time,'each_pay':job.each_pay,'nation':str(province.province+','+city.city+','+district.district)}
            j[count] = temp
            count += 1
        j['length'] = count
########  LOGGER  ##############
        All_Job_Rtree_Logger.delay(nowuser,(lng_min+lng_max)/2,(lat_min+lat_max)/2)
    except:
        logger_rtree.error('\n'+__name__+','+nowuser.username
            +',Check Alljob Rtree Failed.'
            +'\n%s' % traceback.format_exc())
        messages.warning(request, '数据出错，请联系管理员')

    return JsonResponse(j)