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
def backend_user_search(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		if request.method == 'POST':
			username = request.POST.get("username")
			email = request.POST.get("email")
			if username:
				myuser = MyUser.objects.filter(username=username)
				usercount = 1
			else:
				myuser = MyUser.objects.filter(email=email)
				usercount = len(myuser)
			if not myuser:
				messages.warning(request, '没有找到相关用户')
				return render_to_response("backend_user_search.html",{
					"self":request.user,
					},
					context_instance=RequestContext(request))
			else:
				usertype = "用户"
				return render_to_response("backend_user_manage.html",{
					"self":request.user,
					"user":myuser,
					"usertype":usertype,
					"count":usercount,
					},
					context_instance=RequestContext(request))
		else:
			return render_to_response("backend_user_search.html",{
				"self":request.user,
				},
				context_instance=RequestContext(request))