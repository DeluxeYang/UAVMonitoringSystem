#-*- coding: UTF-8 -*-   
import datetime
from django.http import JsonResponse
from model.models import *
from django.core import serializers#objects 转化为 json
from django.http import HttpResponse, HttpResponseRedirect  
# Create your views here.
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def frontend_uav_job_detail_ajax(request):
    job_detail_id = request.GET.get("job_detail_id",None)
    latest = request.GET.get("latest",None)
    job_detail_json = {}
    json = {}
    i = 0
    if job_detail_id:#如果有id传来
        try:
            if not latest:#如果没有latest传来
                job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail_id).order_by('-time')
                job_desc_latest = UAV_Job_Desc.objects.filter(detail_id=job_detail_id).latest('time')
                job_detail_json['job_detail_id'] = job_detail_id
                for u in job_desc:
                    json = {'lng':u.lng,'lat':u.lat,'time':u.time,'height':u.height,'longitude':u.lng,'latitude':u.lat}
                    job_detail_json[i] = json
                    i = i + 1
                job_detail_json['length'] = i
                job_detail_json['latest'] = {'lng':job_desc_latest.lng,'lat':job_desc_latest.lat,'time':job_desc_latest.time,'height':job_desc_latest.height,'longitude':job_desc_latest.lng,'latitude':job_desc_latest.lat}
            else:#如果有latest传来
                latest_t = datetime.datetime.strptime(latest,"%Y-%m-%dT%H:%M:%SZ")
                job_desc_latest = UAV_Job_Desc.objects.filter(detail_id=job_detail_id).latest('time')
                #如果有比latest更新的数据
                if job_desc_latest.time.replace(tzinfo=None) > latest_t:
                    job_desc = UAV_Job_Desc.objects.filter(detail_id=job_detail_id).filter(time__gt=latest_t).order_by('-time')
                    for u in job_desc:##job_dese为时间晚于latest的数据，包含latest
                        json = {'lng':u.lng,'lat':u.lat,'time':u.time,'height':u.height,'longitude':u.lng,'latitude':u.lat}
                        job_detail_json[i] = json
                        i = i + 1
                    job_detail_json['length'] = i
                    job_detail_json['latest'] = {'lng':job_desc_latest.lng,'lat':job_desc_latest.lat,'time':job_desc_latest.time,'height':job_desc_latest.height,'longitude':job_desc_latest.lng,'latitude':job_desc_latest.lat}
                #没有比latest更新的数据
                else:
                    job_detail_json['latest'] = {'lng':job_desc_latest.lng,'lat':job_desc_latest.lat,'time':job_desc_latest.time,'height':job_desc_latest.height,'longitude':job_desc_latest.lng,'latitude':job_desc_latest.lat}
        except:
            pass

    return JsonResponse(job_detail_json)