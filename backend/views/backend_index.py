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
def backend_index(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		uavs = UAV.objects.filter(is_flying=True)
		return render_to_response("backend_index.html",{
			"self":request.user,
			"uavs":uavs,
			},
			context_instance=RequestContext(request))