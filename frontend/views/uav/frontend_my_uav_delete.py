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
logger_delete = logging.getLogger('frontend.views.uav.delete')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_my_uav_delete(request):
    nowuser = request.user
    uav_id = request.GET.get("uav")
    uav = UAV.objects.get(id =uav_id)
    if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
        messages.warning(request, '错误，您没有权限')
        logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
            +str(nowuser.id)+',UAV_id:'+str(uav.id)+',Permission_Issue:'+__name__+'}')
        return HttpResponseRedirect("/myuav/")#不是则返回
    try:
        uav.delete()
        messages.success(request, '删除成功')
    except:
        logger_delete.warning('\n'+__name__+','+nowuser.username+',UAV Delete Failed.{ID:'
            +str(nowuser.id)+',uav_id:'+str(uav.id)+'}'+'\n%s' % traceback.format_exc())
        messages.warning(request, '删除失败')

    return HttpResponseRedirect("/myuav/")