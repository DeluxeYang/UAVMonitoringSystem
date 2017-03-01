#-*- coding: UTF-8 -*-   
import os
import os.path
import datetime
import json
from django.utils.timezone import utc
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth

from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required


from model.models import *
from common.tasks import *  #celery   task

from django.contrib.auth import get_user_model
User = get_user_model()

from django.core import serializers#objects 转化为 json

import logging
logger = logging.getLogger(__name__)
# Create your views here.

@login_required
def test(request):
    Sent_All_Job_Log_To_Flume.delay()
    return render_to_response('test.html',{
    },
    context_instance=RequestContext(request))