#-*- coding: UTF-8 -*-   
import os
import os.path
import datetime
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
User = get_user_model()
# Create your views here.

@login_required
def backend_job_add(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		userlist = User.objects.all()
		job_type_list = Job_type.objects.all()
		farm_type_list = Farm_type.objects.all()
		if request.method == 'POST':###有数据提交时执行
			user_id = request.POST.get("user")
			number = request.POST.get("number")
			describe = request.POST.get("describe")
			border_file = request.FILES.get("border_file")
			border_describe = request.POST.get("border_describe")
			status = request.POST.get("status")
			person_in_charge = request.POST.get("person_in_charge")
			start_time = request.POST.get("start_time")
			end_time = request.POST.get("end_time")
			uav_need = request.POST.get("uav_need")
			each_pay = request.POST.get("each_pay")
			address = request.POST.get("address")
			nation = request.POST.get("district")
			job_type = request.POST.get("job_type")
			jobtype = Job_type.objects.get(id=job_type)
			farm_type = request.POST.get("farm_type")
			farmtype = Farm_type.objects.get(id=farm_type)
			starttime = datetime.datetime.strptime(start_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
			endtime = datetime.datetime.strptime(end_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
			if starttime > endtime:
				messages.warning(request,"添加失败，开始时间晚于结束时间")
			else:
				try:
					user = User.objects.get(id=user_id)
					job = Job()
					job.user = user
					job.job_type = jobtype
					job.farm_type = farmtype
					job.number = number
					job.describe = describe
					job.border_file = border_file
					job.border_describe = border_describe
					job.status = status
					job.person_in_charge = person_in_charge
					if start_time:
						job.start_time = start_time
					if end_time:
						job.end_time = end_time
					if uav_need:
						job.uav_need = uav_need
					if each_pay:
						job.each_pay = each_pay
					job.address = address
					job.nation = nation
					job.save()
					messages.success(request,"添加成功")
				except:
					messages.warning(request,"添加失败")

		return render_to_response("backend_job_add.html",{
			"self":request.user,
			"user":userlist,
			"job_type_list":job_type_list,
			"farm_type_list":farm_type_list,
			},
			context_instance=RequestContext(request))