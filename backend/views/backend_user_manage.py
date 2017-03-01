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
def backend_user_manage(request):
	staff=request.user.is_admin
	delete_list = []
	if not staff:
		return HttpResponseRedirect("/")
	else:
		admin = request.GET.get("is_admin","0")##用户管理和管理员管理区分
		if admin=="1":
			usertype = "管理员"
		else:
			usertype = "普通用户"


		if 'batch_delete' in request.POST:##批量删除
			id_selected = request.POST.getlist('user_manage_selected','')
			for i in id_selected:
				delete_list.append(i)
			delete_user = MyUser.objects.filter(id__in = delete_list)
			for one in delete_user:
				one.delete()
				
		myuser = MyUser.objects.filter(is_admin=admin)
		usercount = len(myuser)

		return render_to_response("backend_user_manage.html",{
			"self":request.user,
			"user":myuser,
			"usertype":usertype,
			"count":usercount,
			},
			context_instance=RequestContext(request))