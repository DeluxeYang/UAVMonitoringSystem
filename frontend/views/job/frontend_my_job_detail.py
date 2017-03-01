#-*- coding: UTF-8 -*-  
import os
import os.path
import datetime
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

from django.core import serializers#objects 转化为 json
from django.contrib.auth import get_user_model
User = get_user_model()

import logging
import traceback
logger_edit = logging.getLogger('frontend.views.job.edit')
logger_permissions = logging.getLogger('permissions')
# Create your views here.
@login_required
def frontend_my_job_detail(request):
    nowuser = request.user
    job_id = request.GET.get("job")
    try:
        job = Job.objects.get(id=job_id)
        if job.user_id != nowuser.id:#检查这个编号的无人机是否属于当前用户
            messages.warning(request, '错误，您没有权限')
            logger_permissions.warning('\n'+__name__+','+nowuser.username+',Permission Issue.{ID:'
                +str(nowuser.id)+',Job_id:'+str(job.id)+',Permission_Issue:'+__name__+'}')
            return HttpResponseRedirect("/myjob/")#不是则返回

        if request.method == 'POST':###有数据提交时执行
            #记录原始数据
            original_describe = job.describe
            original_status = job.status
            original_person_in_charge = job.person_in_charge
            original_start_time = job.start_time
            original_end_time = job.end_time
            original_uav_need = job.uav_need
            original_selected = job.uav_selected
            original_each_pay = job.each_pay
            original_job_type = job.job_type.type
            original_farm_type = job.farm_type.type
            #更改数据
            describe = request.POST.get("describe")
            status = request.POST.get("status")
            person_in_charge = request.POST.get("person_in_charge")
            start_time = request.POST.get("start_time")
            end_time = request.POST.get("end_time")
            uav_need = request.POST.get("uav_need")
            uav_selected = request.POST.get("uav_selected")
            each_pay = request.POST.get("each_pay")

            job_type = request.POST.get("job_type")
            jobtype = Job_type.objects.get(id=job_type)
            farm_type = request.POST.get("farm_type")
            farmtype = Farm_type.objects.get(id=farm_type)

            starttime = datetime.datetime.strptime(start_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
            endtime = datetime.datetime.strptime(end_time, "%Y-%m-%d %H:%M:%S").replace(tzinfo=utc)
            if starttime > endtime:
                messages.warning(request,"编辑失败，开始时间晚于结束时间")
            else:
                try:
                    job.job_type = jobtype
                    job.farm_type = farmtype
                    job.describe = describe
                    # if job.border_file:#在已有记录的情况下
                    #     if border_file_L == '' or border_file:#如果清空或者新上传
                    #         file_object = settings.MEDIA_ROOT+str(job.border_file)#则删除原文件
                    #         if os.path.exists(file_object):
                    #             os.remove(file_object)#删除原来的文件
                    #     if border_file:#如果新上传
                    #         job.border_file = border_file#则替换
                    #     if not border_file and border_file_L == '':#如果清空，且没有上传
                    #         job.border_file = ''
                    #     #剩余的情况是，没清空，也没上传，所以什么都不做
                    # else:
                    #     job.border_file = border_file
                    # job.border_describe = border_describe
                    job.status = status
                    job.person_in_charge = person_in_charge
                    if start_time:
                        job.start_time = start_time
                    if end_time:
                        job.end_time = end_time
                    job.uav_need = uav_need
                    job.uav_selected = uav_selected
                    job.each_pay = each_pay

                    job.save()
                    logger_edit.info('\n'+__name__+','+nowuser.username+',Edit Job Successed.{ID:'
                        +str(nowuser.id)+',Job_id:'+str(job.id)+',describe:'+str(original_describe)
                        +',status:'+str(original_status)+',person_in_charge:'+str(original_person_in_charge)
                        +',start_time:'+str(original_start_time)+',end_time:'+str(original_end_time)
                        +',uav_need:'+str(original_uav_need)+',uav_selected:'+str(original_selected)
                        +',each_pay:'+str(original_each_pay)+',job_type:'+str(original_job_type)
                        +',farm_type:'+str(original_farm_type)+'}')
                    messages.success(request, '提交成功')
                except:
                    logger_edit.error('\n'+__name__+','+nowuser.username+',Edit Job Failed.{ID:'
                        +str(nowuser.id)+',Job_id:'+str(job.id)+'}'+'\n%s' % traceback.format_exc())
                    messages.warning(request, '提交失败')

        job = Job.objects.get(id=job_id)
        job_type_list = Job_type.objects.exclude(id=job.job_type.id)
        farm_type_list = Farm_type.objects.exclude(id=job.farm_type.id)

        district = Nation.objects.get(code=job.nation)
        city = Nation.objects.get(id=district.parent)
        province = Nation.objects.get(id=city.parent)
        
        job_detail = UAV_Job_Detail.objects.filter(job_id=job_id).filter(confirm=True)
        job_apply = UAV_Job_Detail.objects.filter(job_id=job_id).filter(confirm=False)
        job_border = Job_Border.objects.filter(job_id=job_id)

    except:
        messages.warning(request, '数据错误，请联系管理员')
        logger_edit.error('\n'+__name__+','+nowuser.username+'.{ID:'+str(nowuser.id)
            +',Job_id:'+str(job_id)+'}'+'\n%s' % traceback.format_exc())
        return HttpResponseRedirect("/myjob/")#不是则返回

    return render_to_response('frontend_my_job_detail.html',{
        'self':nowuser,
        'job':job,
        "job_detail":job_detail,
        "job_apply":job_apply,
        "job_border":job_border,
        "job_border_json":serializers.serialize("json",job_border),
        "job_type_list":job_type_list,
        "farm_type_list":farm_type_list,
        "province":province,
        "city":city,
        "district":district,
        },
        context_instance=RequestContext(request))