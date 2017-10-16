# -*- coding: UTF-8 -*-
import math

from django.shortcuts import render_to_response
from django.template.context import RequestContext
from model.models import *
from django.contrib.auth import get_user_model
from common.myRtree import myRtree
from collections import Counter
User = get_user_model()


def get_nation_grade(nation1, nation2):
    if nation1 == nation2:
        return {"same_province": 10, "same_city": 10, "same_district": 10}
    elif nation1[:4] == nation2[:4]:
        return {"same_province": 10, "same_city": 10, "same_district": 0}
    elif nation1[:2] == nation2[:2]:
        return {"same_province": 10, "same_city": 0, "same_district": 0}
    else:
        return {"same_province": 0, "same_city": 0, "same_district": 0}


def get_cos_distance(now_user, other_user):
    sum_x = 0.0
    sum_y = 0.0
    sum_xy = 0.0
    for _key in now_user:
        sum_x += now_user[_key] * now_user[_key]
        sum_y += other_user[_key] * other_user[_key]
        sum_xy += now_user[_key] * other_user[_key]
    if sum_xy == 0.0:
        return 0
    return sum_xy / math.sqrt(sum_x * sum_y)


def job_recommend_format(_job):
    job = Job.objects.get(id=_job)
    district = Nation.objects.get(code=job.nation)
    city = Nation.objects.get(id=district.parent)
    province = Nation.objects.get(id=city.parent)
    status = {0: "未开始", 1: "进行中", 2: "已完成"}
    temp = {'number': job.number, 'id': job.id, 'username': job.user.username,
            'job_type_id': job.job_type.id, 'farm_type_id': job.farm_type.id,
            'status': status[job.status], 'job_type': job.job_type.type, 'farm_type': job.farm_type.type,
            'start_time': job.start_time.strftime('%Y-%m-%d %H:%M:%S'), 'each_pay': job.each_pay,
            'nation': str(province.province + ',' + city.city + ',' + district.district)}
    return temp


def frontend_index(request):
    nowuser = request.user
    usercount = MyUser.objects.all().count()
    uavcount = UAV.objects.all().count()
    recommend_list = []
    try:
        if nowuser.username:
            # 数据获取与整理
            _three_jobs = []
            _nation = MyUser.objects.get(id=nowuser.id).nation
            now_user_instance = {"same_province": 10, "same_city": 10, "same_district": 10}
            now_user_jobs = []
            for i in LoggerUserAndJob.objects.filter(user_id=nowuser.id).order_by("-applied_time", "-checked_time"):
                if len(_three_jobs) <= 3:  # 仅取3条作业，申请>查看，按申请时间排序
                    _three_jobs.append(i.job_id)
                    now_user_instance[i.job_id] = 10 if i.applied else 5  # 当前记录的作业的分数
                now_user_jobs.append(i.job_id)  # 取所有作业
            no_repeat = {}
            other_instances = {}
            for job_id in _three_jobs:  # 找出与这3条作业有关的记录
                temp = LoggerUserAndJob.objects.exclude(user_id=nowuser.id).\
                    filter(job_id=job_id).order_by("-applied_time", "-checked_time")[:10]  # 取出除去当前用户的，与当前作业有关的前5条
                for t in temp:  # 每条记录
                    if t.id not in no_repeat:  # no_repeat
                        no_repeat[t.id] = 1
                        if t.user_id not in other_instances:  # 如果不存在user_id
                            other_instances[t.user_id] = get_nation_grade(_nation, t.user_nation)
                        other_instances[t.user_id][job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
            nation_count = 0
            # 首先查找与当前用户同区的
            for t in LoggerUserAndJob.objects.exclude(user_id=nowuser.id).filter(user_nation=_nation)[:10]:
                if t.id not in no_repeat:  # no_repeat
                    no_repeat[t.id] = 1
                    if t.user_id not in other_instances:  # 如果这个用户没有被记录过
                        other_instances[t.user_id] = get_nation_grade(_nation, t.user_nation)
                        if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                            other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
                    nation_count += 1
            if nation_count < 10:
                for t in LoggerUserAndJob.objects.exclude(user_nation=_nation).\
                                 filter(user_nation__startswith=_nation[:4])[:10]:
                    if t.id not in no_repeat:
                        no_repeat[t.id] = 1
                        if t.user_id not in other_instances:
                            other_instances[t.user_id] = get_nation_grade(_nation, t.user_nation)
                            if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                                other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
                        nation_count += 1
            if nation_count < 10:
                for t in LoggerUserAndJob.objects.exclude(user_nation__startswith=_nation[:4]).\
                                 filter(user_nation__startswith=_nation[:2])[:10]:
                    if t.id not in no_repeat:
                        no_repeat[t.id] = 1
                        if t.user_id not in other_instances:
                            other_instances[t.user_id] = get_nation_grade(_nation, t.user_nation)
                            if t.job_id in _three_jobs:  # 如果这个用户没被记录过，则job也没有被记录过
                                other_instances[t.user_id][t.job_id] = 10 if t.applied else 5  # 当前记录的作业的分数
            for i in other_instances:  # 整理other_instances，没有job的置0
                for job_id in _three_jobs:
                    if job_id not in other_instances[i]:
                        other_instances[i][job_id] = 0
            # 计算最近邻居
            neighbors_distance = []
            for i in other_instances:
                distance = get_cos_distance(now_user_instance, other_instances[i])
                neighbors_distance.append((i, distance))
            neighbors_distance.sort(key=lambda x: x[1], reverse=True)
            print(now_user_instance)
            print(other_instances)
            print(neighbors_distance)
            # 建立推荐字典，计算项目评分
            job_dict = {}
            for n in neighbors_distance:
                temp = LoggerUserAndJob.objects.filter(user_id=n[0]).exclude(job_id__in=now_user_jobs) \
                    .order_by("-applied_time", "-checked_time")
                for t in temp:
                    grade = 10 if t.applied else 5
                    if t.job_id not in job_dict:
                        job_dict[t.job_id] = grade * n[1]
                    else:
                        job_dict[t.job_id] += grade * n[1]
            # 建立推荐列表
            job_list = []
            for job in job_dict:
                job_list.append((job, job_dict[job]))
            job_list.sort(key=lambda x: x[1], reverse=True)
            print(job_list)
            for job in job_list:
                recommend_list.append(job_recommend_format(job[0]))
    except Exception as e:
        print(e)
    return render_to_response('frontend_index.html', {
        'self': nowuser,
        'usercount': usercount,
        'uavcount': uavcount,
        'job_recommend': recommend_list,
    }, context_instance=RequestContext(request))


def content_recommend(nowuser):
    _recommend_job = []
    try:
        position = JobRecommendByGPS.objects.filter(user_id=nowuser.id).latest("time")
        idx = myRtree()
        job_list = idx.nearest((position.lng, position.lat, position.lng, position.lat), 5)
        for _job in job_list:
            job = Job.objects.get(id=_job)
            district = Nation.objects.get(code=job.nation)
            city = Nation.objects.get(id=district.parent)
            province = Nation.objects.get(id=city.parent)
            status = {0: "未开始", 1: "进行中", 2: "已完成"}
            temp = {'number': job.number, 'id': job.id, 'username': job.user.username,
                    'job_type_id': job.job_type.id, 'farm_type_id': job.farm_type.id,
                    'status': status[job.status], 'job_type': job.job_type.type, 'farm_type': job.farm_type.type,
                    'start_time': job.start_time.strftime('%Y-%m-%d %H:%M:%S'), 'each_pay': job.each_pay,
                    'nation': str(province.province + ',' + city.city + ',' + district.district)}
            _recommend_job.append(temp)
        # 根据查看历史，对其排序
        no_job_repeat = {}
        check_history = JobRecommendByDetail.objects.filter(user_id=nowuser.id).order_by("-time")[:5]
        farm_types = []
        job_types = []
        for c in check_history:
            if c.job_id not in no_job_repeat:  # 去掉重复的job
                no_job_repeat[c.job_id] = 1
                farm_types.append(c.farm_type_id)
                job_types.append(c.job_type_id)
        most_common_farm_type = Counter(farm_types).most_common()[0][0]
        most_common_job_type = Counter(job_types).most_common()[0][0]
        _first = []
        _second = []
        _third = []
        _other = []
        for _job in _recommend_job:
            if _job["job_type_id"] == most_common_job_type:
                if _job["farm_type_id"] == most_common_farm_type:
                    _first.append(_job)
                else:
                    _second.append(_job)
            else:
                if _job["farm_type_id"] == most_common_farm_type:
                    _third.append(_job)
                else:
                    _other.append(_job)
        _recommend_job = _first + _second + _third + _other
    except Exception as e:
        print(e)
    finally:
        return _recommend_job
