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

from common.tasks import *

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
import logging
import traceback
logger_alljob = logging.getLogger('frontend.views.alljob.alljob')
logger_permissions = logging.getLogger('permissions')
def frontend_all_job(request):
    nowuser = request.user
    try:
        job = Job.objects.exclude(status=2).order_by('-start_time')
        order = '逆序'
        district_L = ''
        province_L = ''
        city_L = ''
        if request.method == 'POST':###有数据提交时执行
            province_P = request.POST.get("province")
            city_P = request.POST.get("city")
            district_P = request.POST.get("district")
            #return HttpResponse(province_P+city_P+district_P)
            start_time_order = request.POST.get("start_time_order")
            if district_P != '':
                job = job.filter(nation=district_P)
                district_L = Nation.objects.get(code=district_P)
                province_L = Nation.objects.get(code=province_P)
                city_L = Nation.objects.get(code=city_P)
                All_Job_Logger.delay(nowuser,province=province_L.province,city=city_L.city,district=district_L.district,code=district_P)
            elif city_P != '':
                job = job.filter(nation__startswith=city_P[0:4])
                province_L = Nation.objects.get(code=province_P)
                city_L = Nation.objects.get(code=city_P)
                All_Job_Logger.delay(nowuser,province=province_L.province,city=city_L.city,code=city_P)
            elif province_P != '':
                job = job.filter(nation__startswith=province_P[0:2])
                province_L = Nation.objects.get(code=province_P)
                All_Job_Logger.delay(nowuser,province=province_L.province,code=province_P)
            if start_time_order == '正序':
                job = job.order_by('start_time')
                order = '正序'
            else:
                job = job.order_by('-start_time')
                order = '逆序'

        count = len(job)
        
        for u in job:#把nation表的信息分别提取出来，暂存到job中
            district = Nation.objects.get(code=u.nation)
            city = Nation.objects.get(id=district.parent)
            province = Nation.objects.get(id=city.parent)
            u.nation = province.province+'，'+city.city+'，'+district.district

    except:
        logger_alljob.error('\n'+__name__+','+nowuser.username
            +',Check Alljob Failed.'
            +'\n%s' % traceback.format_exc())
        messages.warning(request, '数据出错，请联系管理员')


    return render_to_response('frontend_all_job.html',{
        'self':nowuser,
        'job':job,
        'order':order,
        'province_L':province_L,
        'city_L':city_L,
        'district_L':district_L,
        'count':count
        },
        context_instance=RequestContext(request))