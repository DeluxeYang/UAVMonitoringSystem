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
logger_confirm = logging.getLogger('frontend.views.uavjob.confirm')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_uav_job_detail_confirm(request):
    nowuser = request.user
    id = request.GET.get("id")
    try:
        jobdetail = UAV_Job_Detail.objects.get(id=id)
        job_detail = UAV_Job_Detail.objects.filter(job_id=jobdetail.job.id).filter(confirm=True)#查询该作业已选的无人机数量
        count = len(job_detail)
        if jobdetail.job.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',uavjobdetail_id:'+str(jobdetail.id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myuav/")#不是则返回
        if jobdetail.confirm == False:
            if count<jobdetail.job.uav_need:#如果已选数量小于需要数量
                jobdetail.confirm = True
                jobdetail.job.uav_selected = count+1
                jobdetail.save()
                jobdetail.job.save()
                messages.success(request, '确认成功')
                logger_confirm.info('\n'+__name__+','+nowuser.username
                    +',Confirm a UAVJOB Successed.{ID:'+str(nowuser.id)
                    +',uav_id:'+str(jobdetail.uav.id)
                    +',job_id:'+str(jobdetail.job.id)
                    +',uav_job_detail_id:'+str(jobdetail.id)+'}')
            else:
                logger_confirm.warning('\n'+__name__+','+nowuser.username
                    +',Confirm a UAVJOB Failed. The job already gets enough uavs.{ID:'+str(nowuser.id)
                    +',uav_id:'+str(jobdetail.uav.id)
                    +',job_id:'+str(jobdetail.job.id)
                    +',uav_job_detail_id:'+str(jobdetail.id)+'}')
                messages.warning(request, '确认失败 已选无人机数量已达到该作业需求数量')
        else:
            logger_confirm.warning('\n'+__name__+','+nowuser.username
                +',Confirm a UAVJOB Failed. The detail already confirmed.{ID:'+str(nowuser.id)
                +',uav_id:'+str(jobdetail.uav.id)
                +',job_id:'+str(jobdetail.job.id)
                +',uav_job_detail_id:'+str(jobdetail.id)+'}')
            messages.success(request, '操作失败，该作业已经确认了')
    except:
        messages.warning(request, '数据错误，请联系管理员')
        logger_confirm.error('\n'+__name__+','+nowuser.username
            +',Confirm a UAVJOB Failed. {ID:'+str(nowuser.id)
            +',uav_job_detail_id:'+str(id)+'}'
            +'\n%s' % traceback.format_exc())
    return HttpResponseRedirect("/jobdetail/uavjobdetail/?id="+id)