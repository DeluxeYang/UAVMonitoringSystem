from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    # ajax
    url(r'^job_border_shapefile_ajax/$', 
        'frontend.views.ajax.frontend_job_border_shapefile_ajax.frontend_job_border_shapefile_ajax'),
    url(r'^uav_job_detail/$', 
        'frontend.views.ajax.frontend_uav_job_detail_ajax.frontend_uav_job_detail_ajax'),
    url(r'^all_job_rtree_ajax/$', 
        'frontend.views.ajax.frontend_all_job_rtree_ajax.frontend_all_job_rtree_ajax'),
)
