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

from django.core import serializers#objects 转化为 json
from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
import logging
import traceback
logger_detail = logging.getLogger('frontend.views.uavjob.detail')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_uav_job_detail(request):
    uavjob_id = request.GET.get("id")
    nowuser = request.user
    try:
        job_detail = UAV_Job_Detail.objects.get(id=uavjob_id)

        if job_detail.job.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',uavjobdetail_id:'+str(job_detail.id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myjob/")#不是则返回

        job_border = Job_Border.objects.filter(job=job_detail.job)
        if job_detail.confirm:
            logger_detail.info('\n'+__name__+','+nowuser.username
                +', Check the UAVJOB Detail Successed.{ID:'+str(nowuser.id)
                +',uav_id:'+str(job_detail.uav.id)
                +',job_id:'+str(job_detail.job.id)
                +',uav_job_detail_id:'+str(job_detail.id)+'}')
        else:
            logger_detail.info('\n'+__name__+','+nowuser.username
                +', Check the UAVJOB **CONFIRM** Detail Successed.{ID:'+str(nowuser.id)
                +',uav_id:'+str(job_detail.uav.id)
                +',job_id:'+str(job_detail.job.id)
                +',uav_job_detail_id:'+str(job_detail.id)+'}')
    except:
        messages.warning(request, '操作失败')
        logger_detail.error('\n'+__name__+','+nowuser.username
            +', UAVJOB Detail Failed. {ID:'+str(nowuser.id)
            +',uav_job_detail_id:'+str(uavjob_id)+'}'
            +'\n%s' % traceback.format_exc())
        return HttpResponseRedirect("/myjob/")#不是则返回


    return render_to_response("frontend_uav_job_detail.html",{
        "self":request.user,
        "job_detail":job_detail,
        "job_border":job_border,
        "job_border_json":serializers.serialize("json",job_border),
        },
        context_instance=RequestContext(request))