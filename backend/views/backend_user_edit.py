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
# Create your views here.

@login_required
def backend_user_edit(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		user_id = request.GET.get("id")
		usertype = "用户"
		
		if request.method == 'POST':###有数据提交时执行
			myuser = MyUser.objects.get(id=user_id)
			try:
				myuser.email = request.POST.get("email")
				headshot = request.FILES.get("headshot")
				if headshot:
					myuser.headshot = headshot
				myuser.address=request.POST.get("address")
				myuser.nation=request.POST.get("district")
				myuser.phone = request.POST.get("phone")
				myuser.describe = request.POST.get("describe")
				myuser.level = request.POST.get("level")
				is_admin = request.POST.get("is_admin")
				if is_admin:
					myuser.is_admin = 1
				else:
					myuser.is_admin = 0
				myuser.save()
				messages.success(request, '提交成功')
			except:
				messages.warning(request, '提交失败')

		myuser = MyUser.objects.get(id=user_id)
		if myuser.is_admin == 1: ###在前端的checkbox显示
			checkbox = "checked"
		else:
			checkbox = ""
		try:
			district = Nation.objects.get(code=myuser.nation)
			city = Nation.objects.get(id=district.parent)
			province = Nation.objects.get(id=city.parent)

			return render_to_response("backend_user_edit.html",{
				"self":request.user,
				"user":myuser,
				"usertype":usertype,
				"checkbox":checkbox,
				"MEDIA_URL":settings.MEDIA_URL,
				"province":province,
				"city":city,
				"district":district,
				},
				context_instance=RequestContext(request))
		except:
			return render_to_response("backend_user_edit.html",{
				"self":request.user,
				"user":myuser,
				"usertype":usertype,
				"checkbox":checkbox,
				"MEDIA_URL":settings.MEDIA_URL,
				},
				context_instance=RequestContext(request))
