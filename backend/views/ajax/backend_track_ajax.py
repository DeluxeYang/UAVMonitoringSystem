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

def backend_track_ajax(request,id):
	uav_id = id
	json_0 = {}
	json_1 = {}
	json_2 = []
	temp = []
	i = 0
	try:
		uav = UAV.objects.get(uav_id_code=uav_id)
		job = Job.objects.get(number=uav.last_job)
		job_detail = UAV_Job_Detail.objects.get(uav_id=uav.id,job_id=job.id)
		job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).order_by('-time')
		for u in job_desc:
			temp = [u.lng,u.lat,time.mktime(u.time.timetuple())]
			json_2.append(temp)
			i = i + 1
		json_1['total'] = i
		json_1['status'] = 0
		json_1['message'] = "成功"
		json_1['pois'] = json_2
		json_0[uav_id] = json_1
	except:
		json_1['total'] = 0
		json_1['status'] = 1
		json_1['message'] = "失败"
		json_1['pois'] = json_2
		json_0[uav_id] = json_1
	
	
	return JsonResponse(json_0)