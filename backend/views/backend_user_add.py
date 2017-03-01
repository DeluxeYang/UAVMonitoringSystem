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
from backend.forms.backend_user_add_form import UserAddForm

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.

@login_required
def backend_user_add(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		usertype = "用户"
		if request.method == 'GET':
			form = UserAddForm()
		else:
			form = UserAddForm(request.POST)
			if form.is_valid():
				username = request.POST.get("username")
				password = request.POST.get("password1")
				email = request.POST.get("email")
				headshot = request.FILES.get("headshot")
				level = request.POST.get("level")
				is_admin = request.POST.get("is_admin")
				if is_admin:
					is_admin = 1
				else:
					is_admin = 0
				try:
					user = User.objects.create_user(username=username,email=email)
					user.set_password(password)
					user.level = level
					user.headshot = headshot
					user.is_admin = is_admin
					user.save()
					messages.success(request, '提交成功')
				except:
					messages.warning(request, '提交失败')
			else:
				
				messages.warning(request, form.non_field_errors())
		return render_to_response("backend_user_add.html",{
			"self":request.user,
			"usertype":usertype,
			"form":form,
			},
			context_instance=RequestContext(request))