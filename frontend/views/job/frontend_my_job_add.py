#-*- coding: UTF-8 -*-  
import os
import os.path
import datetime
import json
 
from django.utils.timezone import utc
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
from common.myRtree import *
from common.tasks import *

from django.contrib.auth import get_user_model
User = get_user_model()

import logging
import traceback
logger_add = logging.getLogger('frontend.views.job.add')
# Create your views here.
@login_required
def frontend_my_job_add(request):
    nowuser = request.user
    #jobs = Job.objects.filter(user_id=nowuser.id).exclude(status=2)
    # if len(jobs)>=nowuser.level*10:
    #     messages.warning(request, '错误，您未完成的作业数量已超过上限')
    #     return HttpResponseRedirect("/myjob/")

    if request.method == 'POST':###有数据提交时执行
        json1=request.POST.get("json")
        if json1:
            req = json.loads(json1)
            json_username = req['username']
            datas = req['datas']

        number = request.POST.get("number")
        describe = request.POST.get("describe")
        shp = request.FILES.get("shp")
        dbf = request.FILES.get("dbf")
        shx = request.FILES.get("shx")
        border_describe = request.POST.get("border_describe")
        status = request.POST.get("status")
        person_in_charge = request.POST.get("person_in_charge")
        start_time = request.POST.get("start_time")
        #return HttpResponse(start_time)
        end_time = request.POST.get("end_time")
        uav_need = request.POST.get("uav_need")
        each_pay = request.POST.get("each_pay")
        nation = request.POST.get("district")
        address = request.POST.get("address")

        job_type = request.POST.get("job_type")
        jobtype = Job_type.objects.get(id=job_type)
        farm_type = request.POST.get("farm_type")
        farmtype = Farm_type.objects.get(id=farm_type)

        starttime = datetime.datetime.strptime(start_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
        endtime = datetime.datetime.strptime(end_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
        if starttime > endtime:
            messages.warning(request,"添加失败，开始时间晚于结束时间")
        else:
            try:
                job = Job()
                job.user = nowuser
                job.job_type = jobtype
                job.farm_type = farmtype
                job.number = number
                job.describe = describe
                job.shape_file_shp = shp
                job.shape_file_dbf = dbf
                job.shape_file_shx = shx
                job.border_describe = border_describe
                job.status = status
                job.person_in_charge = person_in_charge
                if start_time:
                    job.start_time = start_time
                if end_time:
                    job.end_time = end_time
                if uav_need:
                    job.uav_need = uav_need
                if each_pay:
                    job.each_pay = each_pay

                job.address = address
                job.nation = nation
                job.save()
##如果有边界数据，存入job_border
                if json1:
                    for i in datas:
                        job_border = Job_Border()
                        job_border.job = job
                        job_border.lng = i['lng']
                        job_border.lat = i['lat']
                        job_border.save()
##celery导入R树
                    Job_Border_to_Rtree_single.delay(job.id)
##logger_add = logging.getLogger(frontend.views.job.add)
                logger_add.info('\n'+__name__+','+nowuser.username+',Add a new Job.{ID:'+str(nowuser.id)+',Job_id:'+str(job.id)+'}')
                messages.success(request, '提交成功')
            except:
                logger_add.error('\n'+__name__+','+nowuser.username+',Add new Job Failed.'+'\n%s' % traceback.format_exc())
                messages.warning(request, '提交失败')

    job_type_list = Job_type.objects.all()
    farm_type_list = Farm_type.objects.all()

    return render_to_response('frontend_my_job_add.html',{
        'self':nowuser,
        "job_type_list":job_type_list,
        "farm_type_list":farm_type_list,
        },
        context_instance=RequestContext(request))