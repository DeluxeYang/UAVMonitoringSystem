#-*- coding: UTF-8 -*-   
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required
from django.conf import settings

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from model.models import *

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
@login_required
def frontend_profile(request):
    nowuser = request.user
    try:
        district = Nation.objects.get(code=nowuser.nation)
        city = Nation.objects.get(id=district.parent)
        province = Nation.objects.get(id=city.parent)
        return render_to_response('frontend_profile.html',{
            'self':nowuser,
            "MEDIA_URL":settings.MEDIA_URL,
            "province":province,
            "city":city,
            "district":district,
            },
            context_instance=RequestContext(request))
    except:
        return render_to_response('frontend_profile.html',{
            'self':nowuser,
            "MEDIA_URL":settings.MEDIA_URL,
            },
            context_instance=RequestContext(request))
