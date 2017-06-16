#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
import logging
import traceback
import datetime
from elasticsearch import Elasticsearch

from model.models import *
from common.myRtree import *
from common.tasks import *

from django.contrib import messages
from django.http import JsonResponse
from django.core import serializers#objects 转化为 json
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt


logger_rtree = logging.getLogger('frontend.views.alljob.rtree')
logger_permissions = logging.getLogger('permissions')

@csrf_exempt
def frontend_job_recommend_ajax(request):
    nowuser = request.user
    pass