#-*- coding: UTF-8 -*-   
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from common.forms.loginform import LoginForm
from model.models import UAV_Model, Job, MyUser, UAV, UAV_Job_Detail, UAV_Job_Detail

from django.contrib.auth import get_user_model
User = get_user_model()

from django.utils.timezone import utc
import datetime
import logging
logger = logging.getLogger(__name__)
# Create your views here.
@login_required
def logout(request):
    messages.warning(request, "退出登录成功")
    myuser = request.user
    login_time = datetime.datetime.strptime(str(myuser.last_login), "%Y-%m-%d %H:%M:%S+00:00") + datetime.timedelta(hours=8)
    time_now = datetime.datetime.now()
    duration = time_now - login_time
    IP = getIPFromDJangoRequest(request)
    auth.logout(request)
    
    logger.info(__name__+', '+myuser.username+', Logout Success.'
    	+'{ID:'+str(myuser.id)+',IP:'+IP+',Duration:'+ str(duration)+'}')
    return HttpResponseRedirect("/")

def getIPFromDJangoRequest(request):
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        return request.META['HTTP_X_FORWARDED_FOR']
    else:
        return request.META['REMOTE_ADDR']