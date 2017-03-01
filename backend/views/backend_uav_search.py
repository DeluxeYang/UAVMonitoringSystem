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
def backend_uav_search(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		if request.method == 'POST':
			uav_id_code = request.POST.get("uav_id_code")
			user = request.POST.get("user")
			if uav_id_code:
				uav = UAV.objects.filter(uav_id_code=uav_id_code)
				uavcount = 1
			else:
				uav = UAV.objects.filter(user__username=user)
				uavcount = len(user)
			if not uav:
				messages.warning(request, '没有找到相关无人机')
				return render_to_response("backend_uav_search.html",{
					"self":request.user,
					},
					context_instance=RequestContext(request))
			else:
				return render_to_response("backend_uav_manage.html",{
					"self":request.user,
					"uav":uav,
					"count":uavcount,
					},
					context_instance=RequestContext(request))
		else:
			return render_to_response("backend_uav_search.html",{
				"self":request.user,
				},
				context_instance=RequestContext(request))