from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    # index
    url(r'^$', 'backend.views.backend_index.backend_index'),
    url(r'^new/$', 'backend.views.backend_new.backend_new'),
    # ajax
    url(r'^index_ajax/$', 'backend.views.ajax.backend_index_ajax.backend_index_ajax'),
    url(r'^trace/$', 'backend.views.ajax.backend_trace_ajax.backend_trace_ajax'),
    url(r'^list/$', 'backend.views.ajax.backend_list_ajax.backend_list_ajax'),
    url(r'^track/(?P<id>([\s\S]*))/$', 'backend.views.ajax.backend_track_ajax.backend_track_ajax'),
    #url(r'^realtime/$', 'backend.views.ajax.backend_realtime_ajax.backend_realtime_ajax'),
    # user   
    url(r'^usermanage/$', 'backend.views.backend_user_manage.backend_user_manage'),
    url(r'^useredit/$', 'backend.views.backend_user_edit.backend_user_edit'),
    url(r'^userdetail/$', 'backend.views.backend_user_detail.backend_user_detail'),
    url(r'^useradd/$', 'backend.views.backend_user_add.backend_user_add'),
    url(r'^userdelete/$', 'backend.views.backend_user_delete.backend_user_delete'),
    url(r'^usersearch/$', 'backend.views.backend_user_search.backend_user_search'),
    # uav_model
    url(r'^uavmodelmanage/$', 'backend.views.backend_uav_model_manage.backend_uav_model_manage'),
    url(r'^uavmodeladd/$', 'backend.views.backend_uav_model_add.backend_uav_model_add'),
    url(r'^uavmodeldetail/$', 'backend.views.backend_uav_model_detail.backend_uav_model_detail'),
    url(r'^uavmodeledit/$', 'backend.views.backend_uav_model_edit.backend_uav_model_edit'),
    url(r'^uavmodeldelete/$', 'backend.views.backend_uav_model_delete.backend_uav_model_delete'),
    url(r'^uavmodelsearch/$', 'backend.views.backend_uav_model_search.backend_uav_model_search'),
    # uav
    url(r'^uavmanage/$', 'backend.views.backend_uav_manage.backend_uav_manage'),
    url(r'^uavadd/$', 'backend.views.backend_uav_add.backend_uav_add'),
    url(r'^uavdetail/$', 'backend.views.backend_uav_detail.backend_uav_detail'),
    url(r'^uavedit/$', 'backend.views.backend_uav_edit.backend_uav_edit'),
    url(r'^uavdelete/$', 'backend.views.backend_uav_delete.backend_uav_delete'),
    url(r'^uavsearch/$', 'backend.views.backend_uav_search.backend_uav_search'),
    # job
    url(r'^jobmanage/$', 'backend.views.backend_job_manage.backend_job_manage'),
    url(r'^jobadd/$', 'backend.views.backend_job_add.backend_job_add'),
    url(r'^jobedit/$', 'backend.views.backend_job_edit.backend_job_edit'),
    url(r'^jobdelete/$', 'backend.views.backend_job_delete.backend_job_delete'),
    url(r'^jobdetail/$', 'backend.views.backend_job_detail.backend_job_detail'),
    url(r'^jobsearch/$', 'backend.views.backend_job_search.backend_job_search'),
    # uavjob
    url(r'^uavjobdetail/$', 'backend.views.backend_uav_job_detail.backend_uav_job_detail'),
)
