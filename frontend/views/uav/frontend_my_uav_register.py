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
logger_reg = logging.getLogger('frontend.views.uav.reg')
# Create your views here.
@login_required
def frontend_my_uav_register(request):
    nowuser = request.user
    uavs = UAV.objects.filter(user_id=nowuser.id).filter(is_active=False)
    # if len(uavs)>=nowuser.level*10:
    #     messages.warning(request, '错误，您未激活的无人机数量已超过上限')
    #     return HttpResponseRedirect("/myuav/")#不是则返回

    if request.method == 'POST':###有数据提交时执行
        uav_id_code = request.POST.get("uav_id_code")
        uav_model_id = request.POST.get("uav_model")
        nation = request.POST.get("district")
        address = request.POST.get("address")
        purchase_time = request.POST.get("purchase_time")
        mile_age = request.POST.get("mile_age")
        uav_test = UAV.objects.filter(uav_id_code=uav_id_code)
        if uav_test and uav_test[0].id!=uav.id:
            logger_reg.warning('\n'+__name__+','+nowuser.username+',UAV ID Repeat Error.{ID:'
                +str(nowuser.id)+',uav_id_code:'+str(uav_id_code)+'}')
            messages.warning(request, '提交失败 该编号已存在')
        else:
            try:
                uav = UAV()
                uav_model = UAV_Model.objects.get(id=uav_model_id)
                uav.user = nowuser
                uav.uav_id_code = uav_id_code
                uav.uav_model = uav_model
                uav.address = address
                uav.nation = nation
                if purchase_time:
                    uav.purchase_time = purchase_time
                uav.mile_age = 0
                uav.save()
                messages.success(request, '提交成功')
                logger_reg.info('\n'+__name__+','+nowuser.username+',Reg a new UAV.{ID:'
                    +str(nowuser.id)+',uav_id:'+str(uav.id)+'}')
            except:
                logger_reg.error('\n'+__name__+','+nowuser.username+',Reg UAV Failed.{ID:'
                    +str(nowuser.id)+',uav_id_code:'+str(uav_id_code)+'}'+'\n%s' % traceback.format_exc())
                messages.warning(request, '提交失败')
               
    uav_model_list = UAV_Model.objects.all()

    return render_to_response('frontend_my_uav_register.html',{
        'self':nowuser,
        "uavmodel":uav_model_list,
        },
        context_instance=RequestContext(request))