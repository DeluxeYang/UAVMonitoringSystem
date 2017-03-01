#-*- coding: UTF-8 -*-   
import os
import os.path
import datetime
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

@login_required
def backend_index_ajax(request):
	staff = request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		uav_id = request.GET.get("uav_id",None)
		latest = request.GET.get("latest",None)
		uav_json = {}
		u_json = {}
		i = 0
		if uav_id:#如果有uav_id传来
			#try:
			uav = UAV.objects.get(uav_id_code=uav_id)
			job = Job.objects.get(number=uav.last_job)
			job_detail = UAV_Job_Detail.objects.get(uav_id=uav.id,job_id=job.id)

			if not latest:
				
				job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).order_by('-time')
				job_desc_latest = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).latest('time')
				uav_json['job_detail_id'] = job_detail.id
				for u in job_desc:
					u_json = {'lng':u.lng,'lat':u.lat,'time':u.time,'height':u.height,'longitude':u.longitude,'latitude':u.latitude}
					uav_json[i] = u_json
					i = i + 1
				uav_json['length'] = i
			else:
				latest_t = datetime.datetime.strptime(latest,"%Y-%m-%dT%H:%M:%SZ")
				job_desc_latest = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).latest('time')
				#如果有比latest更新的数据
				if job_desc_latest.time.replace(tzinfo=None) > latest_t:
					job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).filter(time__gte=latest_t).order_by('-time')
					for u in job_desc:##job_dese为时间晚于latest的数据，包含latest
						json = {'lng':u.lng,'lat':u.lat,'time':u.time,'height':u.height,'longitude':u.longitude,'latitude':u.latitude}
						uav_json[i] = json
						i = i + 1
					uav_json['length'] = i
			try:
				thr = UAV_Job_Desc_THR.objects.get(desc_id=job_desc_latest.id)
				ss = UAV_SS.objects.filter(uav_id=uav.id).latest('time')
				uav_json['latest'] = {'lng':job_desc_latest.lng,
								'lat':job_desc_latest.lat,
								'time':job_desc_latest.time,
								'height':job_desc_latest.height,
								'longitude':job_desc_latest.longitude,
								'latitude':job_desc_latest.latitude,
								'AGL':job_desc_latest.AGL,
								'compass':job_desc_latest.compass,
								'VNorth':thr.VNorth,
								'VEast':thr.VEast,
								'VDown':thr.VDown,
								'TAS':thr.TAS,
								'ROLL':thr.ROLL,
								'PITCH':thr.PITCH,
								'YAW':thr.YAW,
								'FuelFlow':thr.FuelFlow,
								'Fuel':thr.Fuel,
								'MainPowerV':ss.MainPowerV,
								'MainPowerA':ss.MainPowerA,
								'ServoPowerV':ss.ServoPowerV,
								'ServoPowerA':ss.ServoPowerA,
								'BoardT':ss.BoardT,
								'longitude':job_desc_latest.longitude,
								'latitude':job_desc_latest.latitude
								}
			except:
				uav_json['latest'] = {'lng':job_desc_latest.lng,
								'lat':job_desc_latest.lat,
								'time':job_desc_latest.time,
								'height':job_desc_latest.height,
								'longitude':job_desc_latest.longitude,
								'latitude':job_desc_latest.latitude,
								'AGL':job_desc_latest.AGL,
								'compass':job_desc_latest.compass,
								'longitude':job_desc_latest.longitude,
								'latitude':job_desc_latest.latitude
								}
			finally:
				uav_json['id'] = uav_id
				uav_json['job'] = uav.last_job
			
			
			
		else:#如果没有数传来
			#try:
				uav = UAV.objects.filter(is_flying=True)
				for u in uav:
					job = Job.objects.get(number=u.last_job)
					job_detail = UAV_Job_Detail.objects.get(uav_id=u.id,job_id=job.id)
					job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail.id).order_by("-time")[0:2]
					if job_desc.count() > 1:
						u_json = {'id':u.uav_id_code,'time':u.time,'lng':job_desc[0].lng,'lat':job_desc[0].lat,'lng_l':job_desc[1].lng,'lat_l':job_desc[1].lat}
					else:
						u_json = {'id':u.uav_id_code,'time':u.time,'lng':job_desc[0].lng,'lat':job_desc[0].lat}
					uav_json[i] = u_json
					i = i + 1
				uav_json['length'] = i
				
			#except:
				#pass

	return JsonResponse(uav_json)