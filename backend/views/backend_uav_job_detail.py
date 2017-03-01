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
def backend_uav_job_detail(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		textlinelist = []
		uavjob_id = request.GET.get("id")
		job_detail = UAV_Job_Detail.objects.get(id=uavjob_id)
		job_desc = UAV_Job_Desc.objects.filter(detail_id=uavjob_id)
		file_object = job_detail.LLHT
		if file_object:
			for lines in file_object.readlines():
				lines = lines.split(b',')
				textlinelist.append(lines)


		return render_to_response("backend_uav_job_detail.html",{
			"self":request.user,
			"job_detail":job_detail,
			"job_desc":job_desc,
			"textlinelist":textlinelist,
			},
			context_instance=RequestContext(request))