#-*- coding: UTF-8 -*-   
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from common.forms.loginform import LoginForm
from model.models import *

from django.contrib.auth import get_user_model
User = get_user_model()

from common.myRtree import *
# Create your views here.
from django.views.decorators.csrf import csrf_exempt

import logging
logger = logging.getLogger(__name__)
@csrf_exempt
def login(request):
    nowuser = request.user
    IP = getIPFromDJangoRequest(request)
    if request.method == 'GET':
        form = LoginForm()
    else:
        form = LoginForm(request.POST)
        if form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = auth.authenticate(username=username, password=password)
            next_page = request.GET.get("next",None)
            if user is not None and user.is_active:
                auth.login(request, user)
                # ###Rtree
                # uavs = UAV.objects.filter(user_id = nowuser.id)
                # if len(uavs) > 0:
                #     j = Rtree_Jobs_Recommend(nowuser)
                #     if j:
                #         messages.success(request, "根据您的位置，为您推荐"+str(j['length'])+"条植保作业，<a href='/alljobsrecommend/' >详情点击</a> ")
                # ###Rtree
                logger.info(__name__+', '+user.username+', Login Success.'
                    +'{ID:'+str(user.id)+',IP:'+IP+'}')
                if user.is_admin:
                    if next_page == None:
                        return HttpResponseRedirect("/backend/")
                    else:
                        return HttpResponseRedirect("%s"%(next_page))
                else:
                    if next_page == None:
                        return HttpResponseRedirect("/")
                    else:
                        return HttpResponseRedirect("%s"%(next_page))
            else:
                logger.info(__name__+'Login Fail.{IP:'+IP+',username:'+username+',password:'
                    +password+'}')
                messages.warning(request, "账号或密码错误")
        else:
            messages.warning(request, form.non_field_errors())
    return render_to_response('login.html',{
        'self':nowuser,
        'form': form,
        },
        context_instance=RequestContext(request))


def getIPFromDJangoRequest(request):
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        return request.META['HTTP_X_FORWARDED_FOR']
    else:
        return request.META['REMOTE_ADDR']