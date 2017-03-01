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
logger_monitoring = logging.getLogger('frontend.views.uav.monitoring')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_my_uav_monitoring(request):
    nowuser = request.user
    uav_id = request.GET.get("uav")
    try:
        uav = UAV.objects.get(id=uav_id)
        if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',uav_id:'+str(uav_id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myuav/")#不是则返回
        try:
            job = Job.objects.get(number=uav.last_job)
        except:
            messages.warning(request, '错误，该无人机没有执行作业')
            logger_monitoring.warning('\n'+__name__+','+nowuser.username
                +', Monitoring UAV Failed.{ID:'+str(nowuser.id)
                +',uav_id:'+str(uav.id)+',job_id:'+str(job.id)+'}')
            return HttpResponseRedirect("/myuav/")#不是则返回
        job_detail = UAV_Job_Detail.objects.get(job_id=job.id,uav_id=uav_id)
        job_border = Job_Border.objects.filter(job=job_detail.job)
        logger_monitoring.info('\n'+__name__+','+nowuser.username
            +', Monitoring UAV Successed.{ID:'+str(nowuser.id)
            +',uav_id:'+str(job_detail.uav.id)
            +',job_id:'+str(job_detail.job.id)
            +',uav_job_detail_id:'+str(job_detail.id)+'}')
    except:
        messages.warning(request, '错误，请与管理员联系')
        logger_monitoring.error('\n'+__name__+','+nowuser.username
            +', Monitoring UAV Failed. {ID:'+str(nowuser.id)
            +',uav_id:'+str(uav_id)+'}'
            +'\n%s' % traceback.format_exc())
        return HttpResponseRedirect("/myuav/")#不是则返回

    return render_to_response('frontend_my_uav_monitoring.html',{
        "self":nowuser,
        "uav":uav,
        "job_detail":job_detail,
        "job_border":job_border,
        "job_border_json":serializers.serialize("json",job_border),
        },
        context_instance=RequestContext(request))