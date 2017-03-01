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
def frontend_index(request):
    try:
        nowuser = request.user
        user = MyUser.objects.all()
        usercount = len(user)
        uav = UAV.objects.all()
        uavcount = len(uav)
        return render_to_response('frontend_index.html',{
            'self':nowuser,
            'usercount':usercount,
            'uavcount':uavcount,
            },
            context_instance=RequestContext(request))
    except:
        return render_to_response('frontend_index.html',{
            'self':nowuser,
            'usercount':0,
            'uavcount':0,
            },
            context_instance=RequestContext(request))
    