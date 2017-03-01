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
def backend_uav_delete(request):
	staff=request.user.is_admin
	if not staff:
		return HttpResponseRedirect("/")
	else:
		uav_id = request.GET.get("id")
		uav = UAV.objects.get(id=uav_id)
		try:
			uav.delete()
			messages.success(request, '删除成功')
		except:
			messages.warning(request, '删除失败')

		return HttpResponseRedirect("/backend/uavmanage/")