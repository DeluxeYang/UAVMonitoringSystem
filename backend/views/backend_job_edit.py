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
from django.conf import settings

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from model.models import *

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.

@login_required
def backend_job_edit(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		job_id = request.GET.get("id")

		if request.method == 'POST':###有数据提交时执行
			job = Job.objects.get(id=job_id)
			user_id = request.POST.get("user")
			describe = request.POST.get("describe")
			status = request.POST.get("status")
			person_in_charge = request.POST.get("person_in_charge")
			start_time = request.POST.get("start_time")
			end_time = request.POST.get("end_time")
			uav_need = request.POST.get("uav_need")
			uav_selected = request.POST.get("uav_selected")
			each_pay = request.POST.get("each_pay")
			nation = request.POST.get("district")
			address = request.POST.get("address")
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
					job.user = user
					job.job_type = jobtype
					job.farm_type = farmtype
					job.describe = describe
# #文件上传，为及时删除，写了以下算法。。
# 					if job.border_file:#在已有记录的情况下
# 						if border_file_L == '' or border_file:#如果清空或者新上传
# 							file_object = settings.MEDIA_ROOT+str(job.border_file)#则删除原文件
# 							if os.path.exists(file_object):
# 								os.remove(file_object)#删除原来的文件
# 						if border_file:#如果新上传
# 							job.border_file = border_file#则替换
# 						if not border_file and border_file_L == '':#如果清空，且没有上传
# 							job.border_file = ''
# 						#剩余的情况是，没清空，也没上传，所以什么都不做
# 					else:
# 						job.border_file = border_file
# ###################################
# 					job.border_describe = border_describe
					job.status = status
					job.person_in_charge = person_in_charge
					if start_time:
						job.start_time = start_time
					if end_time:
						job.end_time = end_time
					job.uav_need = uav_need
					job.uav_selected = uav_selected
					job.each_pay = each_pay
					job.address = address
					job.nation = nation
					job.save()
					messages.success(request, '提交成功')
				except:
					messages.warning(request, '提交失败')

		job = Job.objects.get(id=job_id)

		user_list = User.objects.exclude(id=job.user.id)##exclude
		job_type_list = Job_type.objects.exclude(id=job.job_type.id)
		farm_type_list = Farm_type.objects.exclude(id=job.farm_type.id)

		district = Nation.objects.get(code=job.nation)
		city = Nation.objects.get(id=district.parent)
		province = Nation.objects.get(id=city.parent)
		#eturn HttpResponse(province.province)

		return render_to_response("backend_job_edit.html",{
			"self":request.user,
			"job":job,
			"user":user_list,
			"job_type_list":job_type_list,
			"farm_type_list":farm_type_list,
			"province":province,
			"city":city,
			"district":district,
			},
			context_instance=RequestContext(request))