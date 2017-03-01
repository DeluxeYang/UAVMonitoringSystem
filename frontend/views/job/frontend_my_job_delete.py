#-*- coding: UTF-8 -*-   
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from model.models import *

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.

import logging
import traceback
logger_delete = logging.getLogger('frontend.views.job.delete')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_my_job_delete(request):
    nowuser = request.user
    job_id = request.GET.get("job")
    job = Job.objects.get(id=job_id)
    if job.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
        messages.warning(request, '错误，您没有权限')
        logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
            +str(nowuser.id)+',Job_id:'+str(job.id)+',Permission_Issue:'+__name__+'}')
        return HttpResponseRedirect("/myjob/")#不是则返回
    try:
        #记录原始数据
        original_describe = job.describe
        original_status = job.status
        original_person_in_charge = job.person_in_charge
        original_start_time = job.start_time
        original_end_time = job.end_time
        original_uav_need = job.uav_need
        original_selected = job.uav_selected
        original_each_pay = job.each_pay
        original_job_type = job.job_type.type
        original_farm_type = job.farm_type.type
        original_nation = job.nation
        original_address = job.address
        #更改数据
        original_job_border = {}
        i = 0
        job_border = Job_Border.objects.filter(job=job)
        for u in job_border:
            original_job_border[i] = {'lng':u.lng,'lat':u.lat,'longitude':u.longitude,'latitude':u.latitude}
            u.delete()
            i = i + 1
        job.delete()
        logger_delete.info('\n'+__name__+','+nowuser.username+',Job Deleted.{ID:'
            +str(nowuser.id)+',Job_id:'+str(job.id)+',describe:'+str(original_describe)
            +',status:'+str(original_status)+',person_in_charge:'+str(original_person_in_charge)
            +',start_time:'+str(original_start_time)+',end_time:'+str(original_end_time)
            +',uav_need:'+str(original_uav_need)+',uav_selected:'+str(original_selected)
            +',each_pay:'+str(original_each_pay)+',job_type:'+str(original_job_type)
            +',farm_type:'+str(original_farm_type)+',nation:'+str(original_nation)
            +',address:'+str(original_address)+',job_border:'+str(original_job_border)+'}')
        messages.success(request, '删除成功')
    except:
        logger_delete.warning('\n'+__name__+','+nowuser.username+',Job Delete Failed.{ID:'
            +str(nowuser.id)+',Job_id:'+str(job.id)+'}'+'\n%s' % traceback.format_exc())
        messages.warning(request, '删除失败')

    return HttpResponseRedirect("/myjob/")