#-*- coding: UTF-8 -*-   
import os
import os.path
import datetime
import json
from django.http import JsonResponse
from django.utils.timezone import utc
from django.shortcuts import render_to_response,render,get_object_or_404  


from django.core import serializers#objects 转化为 json

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def backend_trace_ajax(request):
	json_0 = {}
	json_1 = {}
	json_2 = {}
	json_0['status'] = 0
	json_0['actives'] = 0
	json_0['message'] = "成功"
	json_1['name'] = "无人机飞行监视平台"
	json_1['create_time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	json_1['modify_time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
	json_1['service_id'] = 103998
	json_2 = [{
				"key": "loc_time",
				"type": 1,
				"name": "loc_time",
				"is_sortfilter_field": 1,
				"sortfilter_id": 1,
				"is_search_field": 0,
				"is_index_field": 1,
				"is_unique_field": 0,
				"create_time": datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
				"modify_time": datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
				"column_id": 80797,
				"service_id": 103998},
				{
				"key": "track_name",
				"type": 3,
				"name": "车牌号",
				"max_length": 512,
				"is_sortfilter_field": 0,
				"is_search_field": 1,
				"is_index_field": 1,
				"is_unique_field": 1,
				"create_time": datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
				"modify_time": datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
				"column_id": 80796,
				"service_id": 81142}]
	json_1['column'] = json_2
	json_0['service'] = json_1
	return JsonResponse(json_0)