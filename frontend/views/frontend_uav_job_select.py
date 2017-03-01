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
@login_required
def frontend_uav_job_select(request):
    nowuser = request.user
    uav_id = request.GET.get("uav","")
    job_id = request.GET.get("job","")
    try:
        if uav_id != "":
            uav = UAV.objects.get(id=uav_id)
            if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
                messages.warning(request, '错误，您没有权限')
                return HttpResponseRedirect("/myuav/")#不是则返回
            if job_id != "":
                job = Job.objects.get(id=job_id)
                if job.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
                    messages.warning(request, '错误，您没有权限')
                    return HttpResponseRedirect("/myuav/")#不是则返回
                jobdetail = UAV_Job_Detail.objects.get(uav_id=uav_id,job_id=job_id)
                jobdetail.selected = True
                jobdetail.save()
                jobdetail_exclude = UAV_Job_Detail.objects.filter(uav_id=uav_id).exclude(job_id=job_id)
                for u in jobdetail_exclude:
                    u.selected = False
                    u.save()
                messages.success(request, '选择成功')
        return HttpResponseRedirect("/uavjoblist/?uav="+uav_id)
    except:
        messages.warning(request, '错误，您没有权限')   
    return HttpResponseRedirect("/myuav/")