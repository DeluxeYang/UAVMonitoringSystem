from django.contrib import auth
from django.contrib.auth import get_user_model
User = get_user_model()
from django.http import Http404
from django.http import HttpResponse
from itertools import chain

from rest_framework import generics
from rest_framework import permissions
from rest_framework import renderers
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.views import APIView
from rest_framework import status

from model.models import *
from model.serializers import *
from model.permissions import *
@api_view(('GET',))
def api_root(request, format=None): 
    '''
    无登录，无注册


    '''
    return Response({
        'users': reverse('myuser-list', request=request, format=format),

        'uav': reverse('uav-list', request=request, format=format),

        'uavflying': reverse('uav_flying-list', request=request, format=format),

        'uavmodel': reverse('uav_model-list', request=request, format=format),

        'jobs': reverse('jobs-list', request=request, format=format),

        'job': reverse('job-list', request=request, format=format),

        'jobtype': reverse('job_type-list', request=request, format=format),

        'farmtype': reverse('farm_type-list', request=request, format=format),

        'nation': reverse('nation-list', request=request, format=format),

    })

#########################################
#User
class UserList(generics.ListAPIView):
    '''
    返回所有用户列表，功能：查，权限：登录用户
    '''
    queryset = MyUser.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAuthenticated,)

class UserDetail(generics.RetrieveUpdateAPIView):
    '''
    返回pk=pk用户详细信息，功能：改+查，权限：改——用户本人，查——登录用户
    '''
    queryset = MyUser.objects.all()
    serializer_class = User_Serializer
    permission_classes = (permissions.IsAuthenticated,IsUserOrReadOnly)

##################################################################################
#Uav_Flying
class Uav_flying_List(generics.ListAPIView):
    '''
    返回所有，正在飞行的UAV，功能：查，权限：管理员

    '''
    queryset = UAV.objects.filter(is_flying=True)
    serializer_class = Uav_flying_Serializer
    permission_classes = (permissions.IsAdminUser,)

class last_job_latest(generics.RetrieveAPIView):
    '''
    
    '''
    queryset = UAV.objects.all()
    serializer_class = DescSerializer
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        job = Job.objects.get(number=instance.last_job)
        detail = UAV_Job_Detail.objects.get(job=job,uav=instance)
        queryset = UAV_Job_Desc.objects.filter(detail_id=detail.id).latest("time")
        serializer = self.get_serializer(queryset)
        return Response(serializer.data)


class last_job_Detail(generics.RetrieveAPIView):
    '''
    该无人机的最新作业飞行记录

    '''
    queryset = UAV.objects.all()
    serializer_class = DescSerializer
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        job = Job.objects.get(number=instance.last_job)
        detail = UAV_Job_Detail.objects.get(job=job,uav=instance)
        queryset = UAV_Job_Desc.objects.filter(detail_id=detail.id)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class last_job_border_Detail(generics.RetrieveAPIView):
    '''
    该无人机的最新作业边界
    '''
    queryset = UAV.objects.all()
    serializer_class = JobBorderSerializer
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        job = Job.objects.get(number=instance.last_job)
        queryset = Job_Border.objects.filter(job=job)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


##################################################################################
#Uav
class UavList(generics.ListCreateAPIView):
    '''
    返回当前用户UAV列表，功能：查+增，权限：用户
    [增：添加功能完全和uavcreate相同,所需数据与‘查’的不同]
    添加，当前用户 的 UAV,
    [用户user信息不需要添加，request自带]
    需要提交的数据为：
        uav_model:形式为链接link，必需
        uav_id_code:必需
        uav_sim:可空
        controller_sim:可空
        purchase_time:可空
        mile_age:可空

    返回的数据为：
        job ID
        url
        uav_id_code
        user
        uav_model:[link]
        controller_sim
        uav_sim
        mile_age
        purchase_time
    '''
    queryset = UAV.objects.all()
    serializer_class = UavSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def list(self, request):
        # Note the use of `get_queryset()` instead of `self.queryset`
        
        queryset = UAV.objects.filter(user=self.request.user)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        self.serializer_class = Uav_Create_Serializer
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

class UavCreate(generics.CreateAPIView):
    '''
    添加，当前用户 的 UAV,
    [用户user信息不需要添加，request自带]
    需要提交的数据为：
        uav_model:形式为链接link，必需
        uav_id_code:必需
        uav_sim:可空
        controller_sim:可空
        purchase_time:可空
        mile_age:可空

    返回的数据为：
        job ID
        url
        uav_id_code
        user
        uav_model:[link]
        controller_sim
        uav_sim
        mile_age
        purchase_time
    '''
    queryset = UAV.objects.all()
    serializer_class = Uav_Create_Serializer
    permission_classes = (permissions.IsAuthenticated,)
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

class UavDetail(generics.RetrieveUpdateDestroyAPIView):
    '''
    返回pk=pk UAV详细信息，功能：查+改+删，权限：改+删——用户本人 or 查——登录用户
    '''
    queryset = UAV.objects.all()
    serializer_class = Uav_Serializer
    permission_classes = (permissions.IsAuthenticated, IsOwnerOrReadOnly,)#AND的关系
##################################################################################
#UavModel
class UavModelList(generics.ListAPIView):
    '''
    返回所有UAVModel列表，功能：查，权限：登录用户
    '''
    queryset = UAV_Model.objects.all()
    serializer_class = UavModelSerializer
    permission_classes = (permissions.IsAuthenticated,)

class UavModelDetail(generics.RetrieveAPIView):
    '''
    返回pk=pkUAVModel详细信息，功能：查，权限：登录用户
    '''
    queryset = UAV_Model.objects.all()
    serializer_class = UavModel_Serializer
    permission_classes = (permissions.IsAuthenticated,)
##################################################################################
#Job
class JobList(generics.ListAPIView):
    '''
    返回所有未完成的Job（即status不为2）列表，功能：查，权限：任意
    '''
    queryset = Job.objects.exclude(status=2)
    serializer_class = JobSerializer

class Job_List(generics.ListCreateAPIView):
    '''
    返回当前用户Job列表，功能：查+增，权限：查——任意，增——登录用户

    添加，当前用户 的 Job,
    【完全参考/API/job/create/】
    [用户user信息不需要添加，request自带]
    需要提交的数据为：
        如下
    其中，job_type    farm_type 为链接形式
    '''
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def list(self, request):
        # Note the use of `get_queryset()` instead of `self.queryset`
        queryset = Job.objects.filter(user=self.request.user)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        self.serializer_class = Job_Create_Serializer
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

class JobCreate(generics.CreateAPIView):
    '''
    添加，当前用户 的 Job,
    [用户user信息不需要添加，request自带]
    需要提交的数据为：
        如下
    其中，job_type    farm_type 为链接形式
    '''
    queryset = Job.objects.all()
    serializer_class = Job_Create_Serializer
    permission_classes = (permissions.IsAuthenticated,)
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

class JobDetail(generics.RetrieveUpdateDestroyAPIView):
    '''
    返回pk=pkUAVModel详细信息，功能：查+删+改，权限：查——任意，改删——用户本人
    '''
    queryset = Job.objects.all()
    serializer_class = Job_Serializer
    permission_classes = (IsOwnerOrReadOnly,)

class Job_Border_Detail(generics.RetrieveAPIView):
    '''
    根据job_id查找Job_border的记录
    返回uav_job_desc，功能：查，权限：任意
    '''
    queryset = Job.objects.all()
    serializer_class = JobBorderSerializer
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        queryset = Job_Border.objects.filter(job_id=instance.id)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
#########################################
##################################################################################
#Job

class DetailCreate(generics.CreateAPIView):
    '''
    功能：增，权限：用户
    增，即为无人机uav   申请   作业job，申请即在Detail中添加一条记录
        数据需求：
            job 链接
            uav 链接
    '''
    queryset = UAV_Job_Detail.objects.all()
    serializer_class = Detail_Create_Serializer
    permission_classes = (permissions.IsAuthenticated,)

class DetailDetail(generics.RetrieveUpdateDestroyAPIView):
    '''
    返回uav_job_detail，功能：查+改+删，权限：查——任意，改——Job拥有者，删——Job拥有者或者Uav拥有者
    改：用于确认申请
    '''
    queryset = UAV_Job_Detail.objects.all()
    serializer_class = DetailSerializer
    permission_classes = (ReadOnlyANDJobOwnerforUDUavOwnerforD,)


class Detail_pois_Detail(generics.RetrieveAPIView):
    '''
    根据Detail_id查找Desc的记录
    返回uav_job_desc，功能：查，权限：任意
    '''
    queryset = UAV_Job_Detail.objects.all()
    serializer_class = DescSerializer
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        queryset = UAV_Job_Desc.objects.filter(detail_id=instance.id)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
##################################################################################
#UavModel

class DescDetail(generics.RetrieveAPIView):
    '''
    返回pk=pkUAVModel详细信息，功能：查，权限：登录用户
    '''
    queryset = UAV_Job_Desc.objects.all()
    serializer_class = DescSerializer
    permission_classes = (permissions.IsAuthenticated,)
##################################################################################
class JobTypeList(generics.ListAPIView):
    '''
    返回所有JobType列表，功能：查，权限：登录用户
    '''
    queryset = Job_type.objects.all()
    serializer_class = JobTypeSerializer
    permission_classes = (permissions.IsAuthenticated,)
class JobTypeDetail(generics.RetrieveAPIView):
    '''
    返回pk=pk  JobType详细信息，功能：查，权限：登录用户
    '''
    queryset = Job_type.objects.all()
    serializer_class = JobTypeSerializer
    permission_classes = (permissions.IsAuthenticated,)
class FarmTypeList(generics.ListAPIView):
    '''
    返回所有FarmType列表，功能：查，权限：登录用户
    '''
    queryset = Farm_type.objects.all()
    serializer_class = FarmTypeSerializer
    permission_classes = (permissions.IsAuthenticated,)
class FarmTypeDetail(generics.RetrieveAPIView):
    '''
    返回pk=pk  FarmType详细信息，功能：查，权限：登录用户
    '''
    queryset = Farm_type.objects.all()
    serializer_class = FarmTypeSerializer
    permission_classes = (permissions.IsAuthenticated,)
##################################################################################

class NationList(generics.ListAPIView):
    '''
    返回所有省级行政区
    '''
    queryset1 = Nation.objects.filter(parent=1)
    queryset2 = Nation.objects.filter(code=110000)
    queryset3 = Nation.objects.filter(code=120000)
    queryset4 = Nation.objects.filter(code=310000)
    queryset5 = Nation.objects.filter(code=500000)
    queryset = queryset1|queryset2|queryset3|queryset4|queryset5
    serializer_class = NationSerializer

class NationDetail(generics.RetrieveAPIView):
    '''
    返回当前行政区的所有下级行政区，如果没有下级，即返回当前行政区
    '''
    queryset = Nation.objects.all()
    serializer_class = NationSerializer
    permission_classes = (permissions.IsAuthenticated,)
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        queryset = Nation.objects.filter(parent=instance.id)
        if not queryset:
            queryset = Nation.objects.filter(id=instance.id)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)