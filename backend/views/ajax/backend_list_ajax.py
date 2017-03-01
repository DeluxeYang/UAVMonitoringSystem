#-*- coding: UTF-8 -*-   
import os
import os.path
import datetime
import time
import json
from django.http import JsonResponse
from django.utils.timezone import utc
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

from django.core import serializers#objects 转化为 json
User = get_user_model()
# Create your views here.
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def backend_list_ajax(request):
	uav_json = {}
	u_json = {}
	i = 0
	uav = UAV.objects.filter(is_flying=True)#所有正在飞的无人机
	uav_json['pois'] = []
	for u in uav:
		job = Job.objects.get(number=u.last_job)
		job_detail = UAV_Job_Detail.objects.get(uav_id=u.id,job_id=job.id)
		job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).latest("time")
		u_json = {
			"city": "",
			
			"create_time":job_desc.time.strftime('%Y-%m-%d %H:%M:%S'),
			"district": "",
			"loc_time": time.mktime(job_desc.time.timetuple()),
			"location": [
				job_desc.lng,
				job_desc.lat
			],
			"modify_time": job_desc.time.strftime('%Y-%m-%d %H:%M:%S'),
			"province": "",
			"title": "",
			"high":job_desc.height,
			"track_name": u.uav_id_code,
			"city_id": 0,
			"track_id": u.uav_id_code
			}
		#u_json = {'id':u.uav_id_code,'time':u.time,'lng':job_desc.longitude,'lat':job_desc.latitude}
		uav_json['pois'].append(u_json)
		i = i + 1
	uav_json['size'] = i
	uav_json['total'] = i
	uav_json['status'] = 0
	uav_json['message'] = "成功"

	return JsonResponse(uav_json)