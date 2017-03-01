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
from common.myRtree import *

import json
from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
import logging
import traceback
logger_recommend = logging.getLogger('frontend.views.alljob.recommend')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_all_job_recommend_rtree(request):
    nowuser = request.user
    uavs = UAV.objects.filter(user_id = nowuser.id)
    if len(uavs) > 0:
        j = Rtree_Jobs_Recommend(nowuser)
        if j:
            logger_recommend.info('\n'+__name__+','+nowuser.username
                +',Recommend Alljob Successed.'
                +'{ID:'+str(nowuser.id)+',code:'+str(nowuser.nation)+'}')
            return render_to_response('frontend_all_job_recommend_rtree.html',{
                'self':nowuser,
                'j':json.dumps(j),
                },
                context_instance=RequestContext(request))
        else:
            logger_recommend.warning('\n'+__name__+','+nowuser.username
                +',Recommend Alljob Failed.'
                +'{ID:'+str(nowuser.id)+'}')
            messages.warning(request, "数据错误")
            return HttpResponseRedirect("/")
    else:
        messages.warning(request, "您没有注册的无人机")
        return HttpResponseRedirect("/")
