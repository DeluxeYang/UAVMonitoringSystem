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
from common.tasks import *

from django.core import serializers#objects 转化为 json
from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
import logging
import traceback
logger_view_details = logging.getLogger('frontend.views.alljob.view_details')
logger_apply = logging.getLogger('frontend.views.uavjob.apply')
logger_permissions = logging.getLogger('permissions')
@login_required
def frontend_job_details(request):
    nowuser = request.user
    job_id = request.GET.get("job")
    try:
        job = Job.objects.get(id=job_id)##查询作业
        uav = UAV.objects.filter(user_id=nowuser.id).filter(is_active=True)##查询用户的无人机
        count = len(uav)
        district = Nation.objects.get(code=job.nation)
        city = Nation.objects.get(id=district.parent)
        province = Nation.objects.get(id=city.parent)

        if request.method == 'POST':###有数据提交时执行
            uav_id = request.POST.get("uav")
            uav_selected = UAV.objects.get(id=uav_id)
            jobdetail_uav = UAV_Job_Detail.objects.filter(uav_id=uav_id)
            jobdetail_job = UAV_Job_Detail.objects.filter(job_id=job.id).filter(uav_id=uav_id)
            if jobdetail_job:
                messages.warning(request, '申请失败 与该无人机已申请过该作业')
                logger_apply.warning('\n'+__name__+','+nowuser.username
                    +',Apply a UAVJOB Failed. The UAV Already Applied the Job.{ID:'+str(nowuser.id)
                    +',uav_id:'+str(uav_id)
                    +',job_id:'+str(job_id)+'}')
            else:
                flag = True
                flag_count = 0
                for u in jobdetail_uav:
                    if job.start_time > u.job.end_time or job.end_time < u.job.start_time:
                        flag_count = flag_count + 1
                    #如果当前作业开始时间 晚于 作业u的结束时间 或者 当前作业结束时间 早于 作业u的开始时间
                    else:
                        flag = False
                if flag == True:
                    job_detail = UAV_Job_Detail()
                    job_detail.uav = uav_selected
                    job_detail.job = job
                    job_detail.confirm = 0
                    job_detail.save()
                    messages.success(request, '申请成功')
                    all_job_apply.delay(nowuser, job)  # 日志
                    logger_apply.info('\n'+__name__+','+nowuser.username
                        +',Apply a UAVJOB Successed.{ID:'+str(nowuser.id)
                        +',uav_id:'+str(job_detail.uav.id)
                        +',job_id:'+str(job_detail.job.id)
                        +',uav_job_detail_id:'+str(job_detail.id)+'}')
                else:
                    logger_apply.warning('\n'+__name__+','+nowuser.username
                        +',Apply a UAVJOB Failed. Time Conflict.{ID:'+str(nowuser.id)
                        +',uav_id:'+str(uav_id)
                        +',job_id:'+str(job_id)+'}')
                    messages.warning(request, '申请失败 与该无人机的其他作业时间冲突')
        else:###没有数据提交时执行
            All_Job_View_Details.delay(nowuser, job)#即查看该作业
    except:
        logger_view_details.error('\n'+__name__+','+nowuser.username
            +',View a Job Details Failed. {ID:'+str(nowuser.id)
            +',job_id:'+str(job_id)+'}'
            +'\n%s' % traceback.format_exc())
        messages.warning(request, '数据错误，请联系管理员')
        return HttpResponseRedirect("/alljob/")#不是则返回
        
    job_border = Job_Border.objects.filter(job_id=job_id)
    return render_to_response('frontend_job_details.html',{
        'self':nowuser,
        'job':job,
        "province":province,
        "city":city,
        "district":district,
        "uav":uav,
        "count":count,
        "job_border":job_border,
        "job_border_json":serializers.serialize("json",job_border),
        },
        context_instance=RequestContext(request))