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
logger_apply = logging.getLogger('frontend.views.uavjob.apply')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_my_apply(request):
    nowuser = request.user
    uav_id = request.GET.get("uav","")
    try:
        if uav_id != "":
            jobdetail = UAV_Job_Detail.objects.filter(uav_id=uav_id)
            if jobdetail.uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
                messages.warning(request, '错误，您没有权限')
                return HttpResponseRedirect("/myapply/")#不是则返回
        else:
            jobdetail = UAV_Job_Detail.objects.filter(uav__user_id=nowuser.id)
        return render_to_response('frontend_my_apply.html',{
            'self':nowuser,
            'jobdetail':jobdetail,
            },
            context_instance=RequestContext(request))
    except:
        jobdetail = UAV_Job_Detail.objects.filter(uav__user_id=nowuser.id)
        return render_to_response('frontend_my_apply.html',{
            'self':nowuser,
            'jobdetail':jobdetail,
            },
            context_instance=RequestContext(request))