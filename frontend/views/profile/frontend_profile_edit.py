#-*- coding: UTF-8 -*-   
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

import logging
import traceback
logger = logging.getLogger(__name__)
# Create your views here.
@login_required
def frontend_profile_edit(request):
	myuser = request.user
	if request.method == 'POST':###有数据提交时执行
		try:
			#记录原始数据
			original_email = myuser.email
			original_headshot = myuser.headshot
			original_address = myuser.address
			original_nation = myuser.nation
			original_phone = myuser.phone
			original_describe = myuser.describe
			#更改数据
			myuser.email = request.POST.get("email")
			headshot = request.FILES.get("headshot")
			if headshot:
				myuser.headshot = headshot
			myuser.address=request.POST.get("address")
			myuser.nation=request.POST.get("district")
			myuser.phone = request.POST.get("phone")
			myuser.describe = request.POST.get("describe")
			myuser.save()
			# logger.info('\n'+__name__+', '+myuser.username
			# 	+', Changed Profile Success, The Origianl are {ID:'+str(myuser.id)
			# 	+',email:'+original_email+',headshot:'+str(original_headshot)
			# 	+',address:'+original_address+',nation:'+original_nation
			# 	+',phone:'+original_phone+',describe:'+original_describe+'}')
			messages.success(request, '修改成功')
		except:
			logger.info('\n'+__name__+', '+myuser.username+', {ID:'+str(myuser.id)
				+'}, Changed Profile Fail.'+'\n%s' % traceback.format_exc())
			messages.warning(request, '修改失败')

	try:
		district = Nation.objects.get(code=myuser.nation)
		city = Nation.objects.get(id=district.parent)
		province = Nation.objects.get(id=city.parent)

		return render_to_response('frontend_profile_edit.html',{
			"self":myuser,
			"MEDIA_URL":settings.MEDIA_URL,
			"province":province,
			"city":city,
			"district":district,
			},
			context_instance=RequestContext(request))
	except:
		return render_to_response('frontend_profile_edit.html',{
			"self":myuser,
			"MEDIA_URL":settings.MEDIA_URL,
			},
			context_instance=RequestContext(request))
