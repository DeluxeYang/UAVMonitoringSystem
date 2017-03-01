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

import logging
import traceback
logger_edit = logging.getLogger('frontend.views.uav.edit')
logger_permissions = logging.getLogger('permissions')
# Create your views here.
@login_required
def frontend_my_uav_detail(request):
    nowuser = request.user
    uav_id = request.GET.get("uav")
    try:
        uav = UAV.objects.get(id=uav_id)

        if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',uav_id:'+str(uav.id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myuav/")#不是则返回

        if request.method == 'POST':###有数据提交时执行
            #记录原始数据
            original_uav_id_code = uav.uav_id_code
            original_address = uav.address
            original_nation = uav.nation
            original_purchase_time = uav.purchase_time
            original_mile_age = uav.mile_age
            #更改数据
            uav_id_code = request.POST.get("uav_id_code")
            address = request.POST.get("address")
            nation = request.POST.get("district")
            purchase_time = request.POST.get("purchase_time")
            mile_age = request.POST.get("mile_age")
            uav_test = UAV.objects.filter(uav_id_code=uav_id_code)
            if uav_test and uav_test[0].id!=uav.id:
                messages.warning(request, '提交失败 该编号已存在')
                logger_edit.warning('\n'+__name__+','+nowuser.username+',UAV ID Repeat Error.{ID:'
                    +str(nowuser.id)+',uav_id_code:'+str(uav_id_code)+',uav_id:'+uav.id+'}')
            else:
                try:
                    #uav_model = UAV_Model.objects.get(id=uav_model_id)
                    uav.uav_id_code = uav_id_code
                    uav.address = address
                    uav.nation = nation
                    if purchase_time:
                        uav.purchase_time = purchase_time
                    uav.mile_age = mile_age
                    uav.save()
                    messages.success(request, '提交成功')
                    logger_edit.info('\n'+__name__+','+nowuser.username+',Edit UAV Successed.{ID:'
                        +str(nowuser.id)+',uav_id:'+str(uav.id)+',uav_id_code:'+str(original_uav_id_code)
                        +',address:'+str(original_address)+',nation:'+str(original_nation)
                        +',purchase_time:'+str(original_purchase_time)+',mile_age:'+str(original_mile_age)+'}')
                except:
                    logger_edit.error('\n'+__name__+','+nowuser.username+',Edit uav Failed.{ID:'
                        +str(nowuser.id)+',uav_id:'+str(uav.id)+'}'+'\n%s' % traceback.format_exc())
                    messages.warning(request, '提交失败')

        uav = UAV.objects.get(id=uav_id)                
        uav_model_list = UAV_Model.objects.exclude(id=uav.uav_model.id)
        district = Nation.objects.get(code=uav.nation)
        city = Nation.objects.get(id=district.parent)
        province = Nation.objects.get(id=city.parent)

    except:
        messages.warning(request, '数据错误，请联系管理员')
        logger_edit.error('\n'+__name__+','+nowuser.username+'.{ID:'+str(nowuser.id)
            +'}'+'\n%s' % traceback.format_exc())
        return HttpResponseRedirect("/myuav/")#不是则返回

    return render_to_response('frontend_my_uav_detail.html',{
        'self':nowuser,
        'uav':uav,
        "uavmodel":uav_model_list,
        "province":province,
        "city":city,
        "district":district,
        },
        context_instance=RequestContext(request))