import datetime
import time
from django.utils.timezone import utc
from django.contrib import auth
from django.contrib.auth import get_user_model
User = get_user_model()

from rest_framework import serializers

from model.models import *
from model.custom_field import *
#########################################
#User
class UserSerializer(serializers.HyperlinkedModelSerializer):
    uav = serializers.HyperlinkedRelatedField(many=True, view_name='uav-detail', read_only=True)
    
    class Meta:
        model = MyUser
        fields = ('url','id', 'username','email','is_admin','level','headshot','uav')

class User_Serializer(serializers.HyperlinkedModelSerializer):
    uav = serializers.HyperlinkedRelatedField(many=True, view_name='uav-detail', read_only=True)
    
    class Meta:
        model = MyUser
        fields = ('url','id', 'username','email','headshot','describe','level','nation','address','phone','uav')
#########################################
#Uav


class Uav_flying_Serializer(serializers.HyperlinkedModelSerializer):
    last_job = serializers.HyperlinkedIdentityField(view_name='last_job', read_only=True)
    last_job_border = serializers.HyperlinkedIdentityField(view_name='last_job_border', read_only=True)
    last_job_latest = last_job_latestHyperlink(view_name = 'last_job_latest',read_only=True)
    user = serializers.HyperlinkedRelatedField(view_name='myuser-detail', read_only=True)
    class Meta:
        model = UAV
        fields = ('url','id','user','uav_id_code','is_flying','time','last_job_latest','last_job','last_job_border')

class UavSerializer(serializers.HyperlinkedModelSerializer):
    user_id = serializers.ReadOnlyField(source='user.username')
    uav_model_name = serializers.ReadOnlyField(source='uav_model.uav_model')
    user = serializers.HyperlinkedRelatedField(view_name='myuser-detail', read_only=True)
    uav_model = serializers.HyperlinkedRelatedField(view_name='uav_model-detail', read_only=True)
    uav_job_detail = serializers.HyperlinkedRelatedField(many=True, view_name='uav_job_detail-detail', read_only=True)
    job = serializers.HyperlinkedRelatedField(many=True, view_name='job-detail', read_only=True)
    class Meta:
        model = UAV
        fields = ('url','id', 'user_id','user','uav_model_name','uav_model' ,'uav_id_code','is_flying','last_job','time','uav_job_detail','job')

class Uav_Create_Serializer(serializers.HyperlinkedModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')

    class Meta:
        model = UAV
        fields = ('url','id', 'user','uav_model','uav_id_code','uav_sim','controller_sim','purchase_time','mile_age')

class Uav_Serializer(serializers.HyperlinkedModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')
    uav_model = serializers.ReadOnlyField(source='uav_model.uav_model')
    last_job = serializers.ReadOnlyField(source='uav_model.uav_model')
    is_flying = serializers.ReadOnlyField(source='uav_model.uav_model')
    uav_job_detail = serializers.HyperlinkedRelatedField(many=True, view_name='uav_job_detail-detail', read_only=True)
    job = serializers.HyperlinkedRelatedField(many=True, view_name='job-detail', read_only=True)
    class Meta:
        model = UAV
        fields = ('url','id', 'user','uav_model', 'uav_id_code','uav_sim','controller_sim','purchase_time','mile_age','last_job','is_flying','uav_job_detail','job')
#########################################
#UavModel
class UavModelSerializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = UAV_Model
        fields = ('url', 'id','uav_model', 'name','function_type','serial_number','company')

class UavModel_Serializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = UAV_Model
        fields = ('url', 'id','uav_model', 'name','function_type','serial_number','company',
            'origin_place','design_date','weight','load_weight','diagonal_distance','propeller_num',
            'max_rise','max_decline','max_speed','max_height','max_angle','precision_v','precision_h',
            'GPS_mode','signal_mode','other')
#########################################
#job
class JobBorderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job_Border
        fields = ('lng','lat')

class JobSerializer(serializers.HyperlinkedModelSerializer):
    user_id = serializers.ReadOnlyField(source='user.username')
    job_type = serializers.ReadOnlyField(source='job_type.type')
    farm_type = serializers.ReadOnlyField(source='farm_type.type')
    class Meta:
        model = Job
        fields = ('url','user_id','number','status','start_time',
            'each_pay','nation','job_type','farm_type')

class Job_Create_Serializer(serializers.HyperlinkedModelSerializer):
    user_id = serializers.ReadOnlyField(source='user.username')
    class Meta:
        model = Job
        fields = ('url','id','user_id','number','describe',
            'person_in_charge','start_time','end_time','uav_need','uav_selected',
            'each_pay','nation','address','job_type','farm_type')

class Job_Serializer(serializers.HyperlinkedModelSerializer):
    user_id = serializers.ReadOnlyField(source='user.username')
    job_type = serializers.ReadOnlyField(source='job_type.type')
    farm_type = serializers.ReadOnlyField(source='farm_type.type')
    user = serializers.HyperlinkedRelatedField(view_name='myuser-detail', read_only=True)
    uav_job_detail = serializers.HyperlinkedRelatedField(many=True, view_name='uav_job_detail-detail', read_only=True)
    job_border = serializers.HyperlinkedIdentityField(view_name='jobborder', read_only=True)
    class Meta:
        model = Job
        fields = ('url','id', 'user_id','user','number','describe' ,'status',
            'person_in_charge','start_time','end_time','uav_need','uav_selected',
            'each_pay','nation','address','job_type','farm_type','uav_job_detail','job_border')
#########################################
#job_detail
    #########################################
    #UAV_Job_Desc
class DescSerializer(serializers.ModelSerializer):
    class Meta:
        model = UAV_Job_Desc
        fields = ('id','time','lng','lat','height','AGL','compass','longitude','latitude')

class DetailSerializer(serializers.HyperlinkedModelSerializer):
    uav = serializers.HyperlinkedRelatedField(view_name='uav-detail', read_only=True)
    job = serializers.HyperlinkedRelatedField(view_name='job-detail', read_only=True)
    uav_job_desc = serializers.HyperlinkedIdentityField(view_name='pois', read_only=True)
    class Meta:
        model = UAV_Job_Detail
        fields = ('url', 'uav','job','confirm','LLHT','uav_job_desc')

class Detail_Create_Serializer(serializers.HyperlinkedModelSerializer):
    
    class Meta:
        model = UAV_Job_Detail
        fields = ('url','uav','job')
#########################################
#job_type  farm_type
class JobTypeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Job_type
        fields = ('url','id','type')
class FarmTypeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Farm_type
        fields = ('url','id','type')

class NationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Nation
        fields = ('url','id','code','province','city','district','parent')
