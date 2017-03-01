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
def get_job_border_ajax(request):
	uav_id = request.GET.get("uav_id",None)
	job_border_json = {}
	i = 0
	if uav_id:
		uav = UAV.objects.get(uav_id_code=uav_id)
		job = Job.objects.get(number=uav.last_job)
		job_border = Job_Border.objects.filter(job=job)
		for u in job_border:
			job_border_json[i] = {'lng':u.lng,'lat':u.lat}
			i = i + 1
		job_border_json['id'] = job.id
		job_border_json['length'] = i

	return JsonResponse(job_border_json)