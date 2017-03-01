from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
admin.autodiscover()


urlpatterns = patterns('',
    
    url(r'^upload/(?P<path>.*)$','django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    #API
    url(r'^API/', include('model.urls')),
    # backend:
    url(r'^backend/', include('backend.urls')),
    # frontend:
    url(r'^frontend/', include('frontend.urls')),
    # admin:
    url(r'^admin/', include(admin.site.urls)),
    # common:
    url(r'^login/$', 'common.views.login.login'),
    url(r'^logout/$', 'common.views.logout.logout'),
    url(r'^register/$', 'common.views.register.register'),
    url(r'^changepwd/$', 'common.views.changepwd.changepwd'),
    url(r'^test/$', 'common.views.test.test'),
    # frontend:profile
    url(r'^$', 'frontend.views.frontend_index.frontend_index', name='frontend_index'),
    url(r'^profile/$', 'frontend.views.profile.frontend_profile.frontend_profile'),
    url(r'^profileedit/$', 'frontend.views.profile.frontend_profile_edit.frontend_profile_edit'),
    # frontend:uav
    url(r'^myuav/$', 'frontend.views.uav.frontend_my_uav.frontend_my_uav'),
    url(r'^uavdetail/$', 'frontend.views.uav.frontend_my_uav_detail.frontend_my_uav_detail'),
    #####url(r'^uavdelete/$', 'frontend.views.uav.frontend_my_uav_delete.frontend_my_uav_delete'),
    url(r'^uavregister/$', 'frontend.views.uav.frontend_my_uav_register.frontend_my_uav_register'),
    url(r'^uavmodel/$', 'frontend.views.uav.frontend_uav_model_detail.frontend_uav_model_detail'),
    url(r'^uavmonitoring/$', 'frontend.views.uav.frontend_my_uav_monitoring.frontend_my_uav_monitoring'),
    # frontend:job
    url(r'^myjob/$', 'frontend.views.job.frontend_my_job.frontend_my_job'),
    url(r'^jobdetail/$', 'frontend.views.job.frontend_my_job_detail.frontend_my_job_detail'),
    url(r'^jobadd/$', 'frontend.views.job.frontend_my_job_add.frontend_my_job_add'),
    #####url(r'^jobdelete/$', 'frontend.views.job.frontend_my_job_delete.frontend_my_job_delete'),
    url(r'^jobdetail/uavjobdetail/$', 'frontend.views.job.frontend_uav_job_detail.frontend_uav_job_detail'),
    url(r'^jobdetail/uavjobdetail/confirm/$', 'frontend.views.job.frontend_uav_job_detail_confirm.frontend_uav_job_detail_confirm'),
    # frontend:apply
    url(r'^myapply/$', 'frontend.views.apply.frontend_my_apply.frontend_my_apply'),
    # frontend:all_job
    url(r'^alljob/$', 'frontend.views.all_job.frontend_all_job.frontend_all_job'),
    url(r'^alljobs/$', 'frontend.views.all_job.frontend_all_job_rtree.frontend_all_job_rtree'),
    url(r'^alljobsrecommend/$', 'frontend.views.all_job.frontend_all_job_recommend_rtree.frontend_all_job_recommend_rtree'),
    url(r'^alljob/jobdetails/$', 'frontend.views.all_job.frontend_job_details.frontend_job_details'),
    url(r'^alljob/jobcancel/$', 'frontend.views.all_job.frontend_job_cancel.frontend_job_cancel'),
    # ajax
    # common_ajax:
    url(r'^get_job_border_ajax/$', 'common.views.get_job_border_ajax.get_job_border_ajax'),
    url(r'^register_ajax/$', 'common.views.register_ajax.register_ajax'),
)
