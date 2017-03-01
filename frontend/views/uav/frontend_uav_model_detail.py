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
def frontend_uav_model_detail(request):
	nowuser = request.user
	uav_id = request.GET.get("uav")
	try:
		uav = UAV.objects.get(id=uav_id)
		if uav.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
			messages.warning(request, '错误，您没有权限')
			return HttpResponseRedirect("/myuav/")#不是则返回

		uavmodel = UAV_Model.objects.get(id=uav.uav_model_id)
	except:
		messages.warning(request, '错误，您没有权限')
		return HttpResponseRedirect("/myuav/")#不是则返回


	return render_to_response("frontend_uav_model_detail.html",{
		"self":request.user,
		"uavmodel":uavmodel,
		},
		context_instance=RequestContext(request))