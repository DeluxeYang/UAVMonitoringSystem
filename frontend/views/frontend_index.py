# -*- coding: UTF-8 -*-
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from model.models import *
from django.contrib.auth import get_user_model
from django.db.models import Q
from common.myRtree import myRtree
from collections import Counter
User = get_user_model()


def get_nation_grade(nation1, nation2):
    print(nation1, nation2)
    if nation1 == nation2:
        return 8
    elif nation1[:4] == nation2[:4]:
        return 5
    elif nation1[:2] == nation2[:2]:
        return 2
    else:
        return 0


def frontend_index(request):
    nowuser = request.user
    usercount = MyUser.objects.all().count()
    uavcount = UAV.objects.all().count()
    _recommend_job = []
    if nowuser.username:
        _three_jobs = []
        _nation = MyUser.objects.get(id=nowuser.id).nation
        now_user_instance = LoggerUserAndJob.objects.filter(user_id=nowuser.id).order_by("-applied_time")
        for i in now_user_instance:
            if len(_three_jobs) >= 3:  # 仅取3条作业，申请>查看，按时间排序
                break
            _three_jobs.append(i.job_id)
        no_repeat = {}
        other_instances = {}
        for job_id in _three_jobs:  # 找出与这3条作业有关的记录
            temp = LoggerUserAndJob.objects.exclude(user_id=nowuser.id).\
                filter(job_id=job_id).order_by("-applied_time", "-checked_time")[:5]  # 取出除去当前用户的，与当前作业有关的前5条
            for t in temp:  # 每条记录
                if t.id not in no_repeat:  # no_repeat
                    no_repeat[t.id] = 1
                    if t.user_id not in other_instances:  # 如果不存在user_id
                        other_instances[t.user_id] = {"nation_grade": get_nation_grade(_nation, t.user_nation)}
                    other_instances[t.user_id][job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
        nation_count = 0
        for t in LoggerUserAndJob.objects.exclude(user_id=nowuser.id).filter(user_nation=_nation)[:5]:  # 首先查找与当前用户同区的
            if t.id not in no_repeat:  # no_repeat
                no_repeat[t.id] = 1
                if t.user_id not in other_instances:  # 如果这个用户没有被记录过
                    other_instances[t.user_id] = {"nation_grade": 8}
                    if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                        other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
                nation_count += 1
        if nation_count < 5:
            for t in LoggerUserAndJob.objects.exclude(user_nation=_nation).\
                             filter(user_nation__startswith=_nation[:4])[:5]:
                if t.id not in no_repeat:
                    no_repeat[t.id] = 1
                    if t.user_id not in other_instances:
                        other_instances[t.user_id] = {"nation_grade": 5}
                        if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                            other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
                    nation_count += 1
        if nation_count < 5:
            for t in LoggerUserAndJob.objects.exclude(user_nation__startswith=_nation[:4]).\
                             filter(user_nation__startswith=_nation[:2])[:5]:
                if t.id not in no_repeat:
                    no_repeat[t.id] = 1
                    if t.user_id not in other_instances:
                        other_instances[t.user_id] = {"nation_grade": get_nation_grade(_nation, t.user_nation)}
                        if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                            other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
        for i in other_instances:
            for job_id in _three_jobs:
                if job_id not in other_instances[i]:
                    other_instances[i][job_id] = 0
        print(other_instances)


        # nation_code = Nation.objects.get(
        #     Q(city=city, province="") | Q(district=city, province="", city="")).code
    return render_to_response('frontend_index.html', {
        'self': nowuser,
        'usercount': usercount,
        'uavcount': uavcount,
        'job_recommend': _recommend_job,
    }, context_instance=RequestContext(request))


# def frontend_index(request):
#     nowuser = request.user
#     usercount = MyUser.objects.all().count()
#     uavcount = UAV.objects.all().count()
#     _recommend_job = []
#     if nowuser.username:
#         # 根据搜索的区域历史，找到5条附近记录
#         try:
#             position = JobRecommendByGPS.objects.filter(user_id=nowuser.id).latest("time")
#             idx = myRtree()
#             job_list = idx.nearest((position.lng, position.lat, position.lng, position.lat), 5)
#             for _job in job_list:
#                 job = Job.objects.get(id=_job)
#                 district = Nation.objects.get(code=job.nation)
#                 city = Nation.objects.get(id=district.parent)
#                 province = Nation.objects.get(id=city.parent)
#                 status = {0: "未开始", 1: "进行中", 2: "已完成"}
#                 temp = {'number': job.number, 'id': job.id, 'username': job.user.username,
#                         'job_type_id': job.job_type.id, 'farm_type_id': job.farm_type.id,
#                         'status': status[job.status], 'job_type': job.job_type.type, 'farm_type': job.farm_type.type,
#                         'start_time': job.start_time.strftime('%Y-%m-%d %H:%M:%S'), 'each_pay': job.each_pay,
#                         'nation': str(province.province + ',' + city.city + ',' + district.district)}
#                 _recommend_job.append(temp)
#             # 根据查看历史，对其排序
#             no_job_repeat = {}
#             check_history = JobRecommendByDetail.objects.filter(user_id=nowuser.id).order_by("-time")[:5]
#             farm_types = []
#             job_types = []
#             for c in check_history:
#                 if c.job_id not in no_job_repeat:  # 去掉重复的job
#                     no_job_repeat[c.job_id] = 1
#                     farm_types.append(c.farm_type_id)
#                     job_types.append(c.job_type_id)
#             most_common_farm_type = Counter(farm_types).most_common()[0][0]
#             most_common_job_type = Counter(job_types).most_common()[0][0]
#             _first = []
#             _second = []
#             _third = []
#             _other = []
#             for _job in _recommend_job:
#                 if _job["job_type_id"] == most_common_job_type:
#                     if _job["farm_type_id"] == most_common_farm_type:
#                         _first.append(_job)
#                     else:
#                         _second.append(_job)
#                 else:
#                     if _job["farm_type_id"] == most_common_farm_type:
#                         _third.append(_job)
#                     else:
#                         _other.append(_job)
#             _recommend_job = _first + _second + _third + _other
#         except Exception as e:
#             print(e)
#     return render_to_response('frontend_index.html', {
#         'self': nowuser,
#         'usercount': usercount,
#         'uavcount': uavcount,
#         'job_recommend': _recommend_job,
#     }, context_instance=RequestContext(request))
