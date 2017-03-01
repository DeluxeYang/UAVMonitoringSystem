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
logger_cancel = logging.getLogger('frontend.views.uavjob.cancel')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_job_cancel(request):
    nowuser = request.user
    jobdetail_id = request.GET.get("jobdetail")
    try:
        jobdetail = UAV_Job_Detail.objects.get(id=jobdetail_id)
        if jobdetail.uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',uavjobdetail_id:'+str(jobdetail.id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myapply/")#不是则返回
        if jobdetail.confirm:
            logger_cancel.warning('\n'+__name__+','+nowuser.username
                +',Cancel a UAVJOB Failed. The UAVJOB already Confirmed.{ID:'+str(nowuser.id)
                +',uav_job_detail_id:'+str(jobdetail.id)+'}')
            messages.warning(request, '该作业已经确认，无法取消')
        else:
            job_id = jobdetail.job.id
            uav_id = jobdetail.uav.id
            jobdetail_id = jobdetail.id
            confirm = jobdetail.confirm
            jobdetail.delete()
            logger_cancel.info('\n'+__name__+','+nowuser.username
                +',Cancel a UAVJOB Successed.{ID:'+str(nowuser.id)
                +',uav_id:'+str(uav_id)
                +',job_id:'+str(job_id)
                +',confirm:'+str(confirm)
                +',uav_job_detail_id:'+str(jobdetail_id)+'}')
            messages.success(request, '取消成功')
    except:
        logger_cancel.error('\n'+__name__+','+nowuser.username
            +',Cancel a UAVJOB Failed. {ID:'+str(nowuser.id)
            +',uav_job_detail_id:'+str(jobdetail_id)+'}'
            +'\n%s' % traceback.format_exc())
        messages.warning(request, '数据错误，请联系管理员') 
    return HttpResponseRedirect("/myapply/")