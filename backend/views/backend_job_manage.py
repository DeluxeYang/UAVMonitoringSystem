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
def backend_job_manage(request):
	staff=request.user.is_admin
	delete_list = []
	if not staff:
		return HttpResponseRedirect("/")
	else:
		if 'batch_delete' in request.POST:##批量删除
			id_selected = request.POST.getlist('job_manage_selected','')
			for i in id_selected:
				delete_list.append(i)
			delete_user = Job.objects.filter(id__in = delete_list)
			for one in delete_user:
				one.delete()
				
		job = Job.objects.all()
		count = len(job)

		return render_to_response("backend_job_manage.html",{
			"self":request.user,
			"job":job,
			"count":count,
			},
			context_instance=RequestContext(request))