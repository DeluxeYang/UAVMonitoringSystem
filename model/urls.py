from django.conf.urls import url, include
from rest_framework.urlpatterns import format_suffix_patterns
from model import views
# API endpoints
urlpatterns = format_suffix_patterns([
    url(r'^$', views.api_root),

    url(r'^users/$',views.UserList.as_view(),name='myuser-list'),
    url(r'^users/(?P<pk>[0-9]+)/$',views.UserDetail.as_view(),name='myuser-detail'),

    url(r'^uavflying/$',views.Uav_flying_List.as_view(),name='uav_flying-list'),
    url(r'^uav/(?P<pk>[0-9]+)/latest/$',views.last_job_latest.as_view(),name='last_job_latest'),
	url(r'^uav/(?P<pk>[0-9]+)/lastjob/$',views.last_job_Detail.as_view(),name='last_job'),
    url(r'^uav/(?P<pk>[0-9]+)/lastjobborder/$',views.last_job_border_Detail.as_view(),name='last_job_border'),

    url(r'^uav/$',views.UavList.as_view(),name='uav-list'),
    url(r'^uav/create/$',views.UavCreate.as_view(),name='uav_create-list'),
    url(r'^uav/(?P<pk>[0-9]+)/$',views.UavDetail.as_view(),name='uav-detail'),
    
    url(r'^uavmodel/$',views.UavModelList.as_view(),name='uav_model-list'),
    url(r'^uavmodel/(?P<pk>[0-9]+)/$',views.UavModelDetail.as_view(),name='uav_model-detail'),

    url(r'^jobs/$',views.JobList.as_view(),name='jobs-list'),
    url(r'^job/$',views.Job_List.as_view(),name='job-list'),
    url(r'^job/create/$',views.JobCreate.as_view(),name='job_create-list'),
    url(r'^job/(?P<pk>[0-9]+)/$',views.JobDetail.as_view(),name='job-detail'),
    url(r'^job/(?P<pk>[0-9]+)/jobborder/$',views.Job_Border_Detail.as_view(),name='jobborder'),
    
    url(r'^jobdetail/create/$',views.DetailCreate.as_view(),name='detail_create'),
    url(r'^jobdetail/(?P<pk>[0-9]+)/$',views.DetailDetail.as_view(),name='uav_job_detail-detail'),
    url(r'^jobdetail/(?P<pk>[0-9]+)/pois/$',views.Detail_pois_Detail.as_view(),name='pois'),

    url(r'^jobdesc/(?P<pk>[0-9]+)/$',views.DescDetail.as_view(),name='uav_job_desc-detail'),

    url(r'^jobtype/$',views.JobTypeList.as_view(),name='job_type-list'),
    url(r'^jobtype/(?P<pk>[0-9]+)/$',views.JobTypeDetail.as_view(),name='job_type-detail'),
    url(r'^farmtype/$',views.FarmTypeList.as_view(),name='farm_type-list'),
    url(r'^farmtype/(?P<pk>[0-9]+)/$',views.FarmTypeDetail.as_view(),name='farm_type-detail'),

    url(r'^nation/$',views.NationList.as_view(),name='nation-list'),
    url(r'^nation/(?P<pk>[0-9]+)/$',views.NationDetail.as_view(),name='nation-detail'),
])

# Login and logout views for the browsable API
urlpatterns += [
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
]