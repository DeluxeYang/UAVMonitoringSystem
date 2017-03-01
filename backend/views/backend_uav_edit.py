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
def backend_uav_edit(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		uav_id = request.GET.get("id")

		if request.method == 'POST':###有数据提交时执行
			uav = UAV.objects.get(id=uav_id)
			uav_id_code = request.POST.get("uav_id_code")
			user_id = request.POST.get("user")
			uav_model_id = request.POST.get("uav_model")
			uav_sim = request.POST.get("uav_sim")
			controller_sim = request.POST.get("controller_sim")
			address = request.POST.get("address")
			nation=request.POST.get("district")
			purchase_time = request.POST.get("purchase_time")
			mile_age = request.POST.get("mile_age")
			is_active = request.POST.get("is_active")
			uav_test = UAV.objects.filter(uav_id_code=uav_id_code)
			if uav_test and uav_test[0].id!=uav.id:
				messages.warning(request, '提交失败 该编号已存在')
			else:
				try:
					user = User.objects.get(id=user_id)
					uav_model = UAV_Model.objects.get(id=uav_model_id)
					uav.uav_id_code = uav_id_code
					uav.user = user
					uav.uav_model = uav_model
					uav.uav_sim = uav_sim
					uav.controller_sim = controller_sim
					uav.nation = nation
					uav.address = address
					if purchase_time:
						uav.purchase_time = purchase_time
					uav.mile_age = mile_age
					if is_active:
						uav.is_active = 1
					else:
						uav.is_active = 0
					uav.save()
					messages.success(request, '提交成功')
				except:
					messages.warning(request, '提交失败')

		uav = UAV.objects.get(id=uav_id)
		user_list = User.objects.exclude(id=uav.user.id)##exclude
		uav_model_list = UAV_Model.objects.exclude(id=uav.uav_model.id)
		try:
			district = Nation.objects.get(code=uav.nation)
			city = Nation.objects.get(id=district.parent)
			province = Nation.objects.get(id=city.parent)
			return render_to_response("backend_uav_edit.html",{
				"self":request.user,
				"uav":uav,
				"user":user_list,
				"uavmodel":uav_model_list,
				"province":province,
				"city":city,
				"district":district,
				},
				context_instance=RequestContext(request))
		except:
			return render_to_response("backend_uav_edit.html",{
				"self":request.user,
				"uav":uav,
				"user":user_list,
				"uavmodel":uav_model_list,
				},
				context_instance=RequestContext(request))