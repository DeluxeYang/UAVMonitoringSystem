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
def frontend_uav_job_list(request):
    nowuser = request.user
    uav_id = request.GET.get("uav","")
    try:
        if uav_id != "":
            uav = UAV.objects.get(id=uav_id)
            if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
                messages.warning(request, '错误，您没有权限')
                return HttpResponseRedirect("/myuav/")#不是则返回
            jobdetail = UAV_Job_Detail.objects.filter(uav_id=uav_id)
            job_list = []
            for i in jobdetail:
                job = Job.objects.get(id = i.job_id)
                if job == 2:
                    continue
                job_list.append(job)
            return render_to_response('frontend_uav_job_list.html',{
                'self':nowuser,
                'uav':uav,
                'job_list':job_list,
                },
                context_instance=RequestContext(request))
    except:
        messages.warning(request, '错误，您没有权限')   
    return HttpResponseRedirect("/myuav/")