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
def backend_job_search(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		if request.method == 'POST':
			number = request.POST.get("number")
			user = request.POST.get("user")
			if number:
				job = Job.objects.filter(number=number)
				count = 1
			else:
				job = Job.objects.filter(user__username=user)
				count = len(user)
			if not job:
				messages.warning(request, '没有找到相关无人机')
				return render_to_response("backend_job_search.html",{
					"self":request.user,
					},
					context_instance=RequestContext(request))
			else:
				return render_to_response("backend_job_manage.html",{
					"self":request.user,
					"job":job,
					"count":count,
					},
					context_instance=RequestContext(request))
		else:
			return render_to_response("backend_job_search.html",{
				"self":request.user,
				},
				context_instance=RequestContext(request))