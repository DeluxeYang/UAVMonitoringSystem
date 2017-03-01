#-*- coding: UTF-8 -*-  
import json
from django.http import JsonResponse 
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from common.forms.registerform import RegisterForm
from model.models import UAV_Model, Job, MyUser, UAV, UAV_Job_Detail, UAV_Job_Detail

from django.contrib.auth import get_user_model
User = get_user_model()

from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
# Create your views here.
def register_ajax(request):
    form = RegisterForm()
    nowuser = request.user
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password1', '')
            email = request.POST.get('email', '')
            try:
                user = User.objects.create_user(username=username,email=email)
                user.set_password(password)
                user.is_admin = False
                user.level = 1
                user.save()
                messages.success(request, "注册成功")
            except:
                messages.warning(request, "注册失败")
    msg = {'form_msg':form.non_field_errors()}
    return JsonResponse(msg)