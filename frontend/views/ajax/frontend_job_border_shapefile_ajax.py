#-*- coding: UTF-8 -*-   
import datetime
from django.http import JsonResponse
from model.models import *
from django.core import serializers#objects 转化为 json
from django.http import HttpResponse, HttpResponseRedirect
from urllib.request import urlopen
import shapefile
# Create your views here.
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def frontend_job_border_shapefile_ajax(request):
    json = {}
    json["status"] = 0

    if request.method == 'POST':###有数据提交时执行
        try:
            return HttpResponse(request.POST)
            json["status"] = 1
        except:
            json["status"] = 0
                

    return JsonResponse(json)