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
def backend_user_detail(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		user_id = request.GET.get("id")
		usertype = "用户"
		myuser = MyUser.objects.get(id=user_id)
		district = Nation.objects.get(code=myuser.nation)
		city = Nation.objects.get(id=district.parent)
		province = Nation.objects.get(id=city.parent)
		
		if myuser.is_admin == 1: ###在前端的checkbox显示
			checkbox = "checked"
		else:
			checkbox = ""

		return render_to_response("backend_user_detail.html",{
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