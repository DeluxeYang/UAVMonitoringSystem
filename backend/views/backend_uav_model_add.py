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
def backend_uav_model_add(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		if request.method == 'POST':###有数据提交时执行
			uav_model = request.POST.get("uav_model")
			name = request.POST.get("name")
			function_type = request.POST.get("function_type")
			serial_number = request.POST.get("serial_number")
			company = request.POST.get("company")
			origin_place = request.POST.get("origin_place")
			design_date = request.POST.get("design_date")
			weight = request.POST.get("weight")
			load_weight = request.POST.get("load_weight")
			diagonal_distance = request.POST.get("diagonal_distance")
			propeller_num = request.POST.get("propeller_num")
			max_rise = request.POST.get("max_rise")
			max_decline = request.POST.get("max_decline")
			max_speed = request.POST.get("max_speed")
			max_height = request.POST.get("max_height")
			max_angle = request.POST.get("max_angle")
			precision_v = request.POST.get("precision_v")
			precision_h = request.POST.get("precision_h")
			GPS_mode = request.POST.get("GPS_mode")
			signal_mode = request.POST.get("signal_mode")
			other = request.POST.get("other")
			uavm = UAV_Model.objects.filter(uav_model=uav_model)
			if uavm:
				messages.warning(request, '提交失败，型号编号已存在')
			else:
				try:
					uavmodel = UAV_Model()
					uavmodel.uav_model = uav_model
					uavmodel.name = name
					uavmodel.function_type = function_type
					uavmodel.serial_number = serial_number
					uavmodel.company = company
					uavmodel.origin_place = origin_place
					if design_date:
						uavmodel.design_date = design_date
					if weight:
						uavmodel.weight = weight
					if load_weight:
						uavmodel.load_weight = load_weight
					if diagonal_distance:
						uavmodel.diagonal_distance = diagonal_distance
					if propeller_num:
						uavmodel.propeller_num = propeller_num
					if max_rise:
						uavmodel.max_rise = max_rise
					if max_decline:
						uavmodel.max_decline = max_decline
					if max_speed:
						uavmodel.max_speed = max_speed
					if max_height:
						uavmodel.max_height = max_height
					if max_angle:
						uavmodel.max_angle = max_angle
					if precision_v:
						uavmodel.precision_v = precision_v
					if precision_h:
						uavmodel.precision_h = precision_h
					uavmodel.GPS_mode = GPS_mode
					uavmodel.signal_mode = signal_mode
					uavmodel.other = other
					uavmodel.save()
					messages.success(request, '提交成功')
				except:
					messages.warning(request, '提交失败，请检查您的数据')


		return render_to_response("backend_uav_model_add.html",{
			"self":request.user,
			},
			context_instance=RequestContext(request))