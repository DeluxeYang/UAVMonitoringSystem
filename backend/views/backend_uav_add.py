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
def backend_uav_add(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		userlist = User.objects.all()
		uavmodel=UAV_Model.objects.all()
		if request.method == 'POST':###有数据提交时执行
			user_id = request.POST.get("user")
			uav_model_id = request.POST.get("uav_model")
			uav_id_code = request.POST.get("uav_id_code")
			uav_sim = request.POST.get("uav_sim")
			controller_sim = request.POST.get("controller_sim")
			purchase_time = request.POST.get("purchase_time")

			uav_id_code_test = UAV.objects.filter(uav_id_code=uav_id_code)
			if uav_id_code_test:
				messages.warning(request,"添加失败 该编号已存在")
			else:
				try:
					user = User.objects.get(id=user_id)
					uav_model = UAV_Model.objects.get(id=uav_model_id)
					uav = UAV()
					uav.user = user
					uav.uav_model = uav_model

					nation = user.nation   ##自动跟随所属用户的地址
					address = user.address

					uav.uav_id_code = uav_id_code
					uav.uav_sim = uav_sim
					uav.controller_sim = controller_sim
					uav.address = address
					if purchase_time:
						uav.purchase_time = purchase_time
					uav.mile_age = 0
					uav.save()
					messages.success(request,"添加成功")
				except:
					messages.warning(request,"添加失败")

		return render_to_response("backend_uav_add.html",{
			"self":request.user,
			"user":userlist,
			"uavmodel":uavmodel,
			},
			context_instance=RequestContext(request))