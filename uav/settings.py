"""
Django settings for uav project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
import djcelery
djcelery.setup_loader()
0
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '1p0ip*+enl+z1_11*41#u$fwv_^s+zioe&l9u8$)kq6t-mnr_*'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = [
    'localhost', # Also allow FQDN and subdomains
    ]


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'djcelery',          # 加入celery
    'rest_framework',    # 加入restful
    'model',
    'backend',
    'frontend',
    'common',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'uav.urls'

WSGI_APPLICATION = 'uav.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django',
        'USER': 'root',
        'PASSWORD':'123456',
        'HOST': os.environ['MYSQL_PORT_3306_TCP_ADDR'],
        'PORT': '3306',
    }
}

AUTH_USER_MODEL = "model.MyUser"
# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(os.path.dirname(__file__), '../static').replace('\\','/'),
)

LOGIN_URL = '/login/'

MEDIA_ROOT = 'upload/'

MEDIA_URL = '/upload/'


BROKER_URL = 'redis://127.0.0.1:6379/0'

# 使用和Django一样的时区
CELERY_TIMEZONE = TIME_ZONE

#以上为基本配置，以下为周期性任务定义，以celerybeat_开头的  

CELERYBEAT_SCHEDULER = 'djcelery.schedulers.DatabaseScheduler'

REST_FRAMEWORK = {
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'DEFAULT_PERMISSION_CLASSES': ('rest_framework.permissions.AllowAny',),
    'PAGE_SIZE': 50
}

import time  
DJANGO_LOG_LEVEL = DEBUG
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'simple': {
            'format': '%(levelname)s %(asctime)s %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },#控制台显示
        'file_django': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/django/'+time.strftime('%Y-%m-%d')+'_django.log',
        },#Django的log文件
        'file_permissions': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/'+time.strftime('%Y-%m-%d')+'_permissions.log',
        },#user_login的log文件
##################  USER  ################################################
        'file_user_login': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/user/'+time.strftime('%Y-%m-%d')+'_user_login.log',
        },#user_login的log文件
        'file_user_profileedit': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/user/'+time.strftime('%Y-%m-%d')+'_user_profileedit.log',
        },#user_profileedit的log文件
##################  JOB  #################################################
        'file_job_add': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/job/'+time.strftime('%Y-%m-%d')+'_job_add.log',
        },#job_add的log文件
        'file_job_edit': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/job/'+time.strftime('%Y-%m-%d')+'_job_edit.log',
        },#job_edit的log文件
        'file_job_delete': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/job/'+time.strftime('%Y-%m-%d')+'_job_delete.log',
        },#job_delete的log文件
##################  UAV  #################################################
        'file_uav_reg': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uav/'+time.strftime('%Y-%m-%d')+'_uav_reg.log',
        },#uav_reg的log文件
        'file_uav_edit': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uav/'+time.strftime('%Y-%m-%d')+'_uav_edit.log',
        },#uav_reg的log文件
        'file_uav_delete': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uav/'+time.strftime('%Y-%m-%d')+'_uav_delete.log',
        },#uav_reg的log文件
##################  UAV_JOB  #############################################
        'file_uav_monitoring': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uavjob/'+time.strftime('%Y-%m-%d')+'_uav_monitoring.log',
        },#uav_monitoring的log文件
        'file_uav_job_detail': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uavjob/'+time.strftime('%Y-%m-%d')+'_uav_job_detail.log',
        },#uav_job_detail的log文件
        'file_uav_job_confirm': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uavjob/'+time.strftime('%Y-%m-%d')+'_uav_job_confirm.log',
        },#uav_job_confirm的log文件
        'file_uav_job_apply': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uavjob/'+time.strftime('%Y-%m-%d')+'_uav_job_apply.log',
        },#uav_job_confirm的log文件
        'file_uav_job_apply_cancel': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/uavjob/'+time.strftime('%Y-%m-%d')+'_uav_job_apply_cancel.log',
        },#uav_job_confirm的log文件
##################  ALLJOB  #############################################
        'file_all_job': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/alljob/'+time.strftime('%Y-%m-%d')+'_all_job.log',
        },#
        'file_all_job_rtree': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/alljob/'+time.strftime('%Y-%m-%d')+'_all_job_rtree.log',
        },#
        'file_all_job_recommend': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/alljob/'+time.strftime('%Y-%m-%d')+'_all_job_recommend.log',
        },#
        'file_all_job_view_details': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'formatter': 'simple',
            'filename': 'log/alljob/'+time.strftime('%Y-%m-%d')+'_all_job_view_details.log',
        },#
    },
##################  LOGGER  #########################################################################
##################  LOGGER  #########################################################################
##################  LOGGER  #########################################################################
    'loggers': {
        'django': {
            'handlers': ['console','file_django'],
            'propagate': True,
            'level': 'INFO',
        },#
        'django.request': {
            'handlers': ['console','file_django'],
            'level': 'DEBUG',
            'propagate': True,
        },#
        'permissions': {
            'handlers': ['console','file_permissions'],
            'level': 'INFO',
        },#permissions
##################  USER  ################################################
        'common.views': {
            'handlers': ['console','file_user_login'],
            'level': 'INFO',
        },#common.views
        'frontend.views.profile': {
            'handlers': ['console','file_user_profileedit'],
            'level': 'INFO',
        },#frontend.views.profile
##################  JOB  #################################################
        'frontend.views.job.add': {
            'handlers': ['console','file_job_add'],
            'level': 'INFO',
        },#frontend.views.job.add'
        'frontend.views.job.edit': {
            'handlers': ['console','file_job_edit'],
            'level': 'INFO',
        },#frontend.views.job.edit'
        'frontend.views.job.delete': {
            'handlers': ['console','file_job_delete'],
            'level': 'INFO',
        },#frontend.views.job.delete'
##################  UAV  #################################################
        'frontend.views.uav.reg': {
            'handlers': ['console','file_uav_reg'],
            'level': 'INFO',
        },#frontend.views.uav.add'
        'frontend.views.uav.edit': {
            'handlers': ['console','file_uav_edit'],
            'level': 'INFO',
        },#frontend.views.uav.edit'
        'frontend.views.uav.delete': {
            'handlers': ['console','file_uav_delete'],
            'level': 'INFO',
        },#frontend.views.uav.delete'
##################  UAV_JOB  #############################################
        'frontend.views.uav.monitoring': {
            'handlers': ['console','file_uav_monitoring'],
            'level': 'INFO',
        },#frontend.views.uav.monitoring'
        'frontend.views.uavjob.detail': {
            'handlers': ['console','file_uav_job_detail'],
            'level': 'INFO',
        },#frontend.views.uavjob.detail'
        'frontend.views.uavjob.confirm': {
            'handlers': ['console','file_uav_job_confirm'],
            'level': 'INFO',
        },#frontend.views.uavjob.confirm'
        'frontend.views.uavjob.apply': {
            'handlers': ['console','file_uav_job_apply'],
            'level': 'INFO',
        },#frontend.views.uavjob.apply'
        'frontend.views.uavjob.cancel': {
            'handlers': ['console','file_uav_job_apply_cancel'],
            'level': 'INFO',
        },#frontend.views.uavjob.cancel'
##################  ALLJOB  #############################################
        'frontend.views.alljob.alljob': {
            'handlers': ['console','file_all_job'],
            'level': 'INFO',
        },#frontend.views.alljob.alljob'
        'frontend.views.alljob.rtree': {
            'handlers': ['console','file_all_job_rtree'],
            'level': 'INFO',
        },#frontend.views.alljob.rtree'
        'frontend.views.alljob.recommend': {
            'handlers': ['console','file_all_job_recommend'],
            'level': 'INFO',
        },#frontend.views.alljob.recommend'
        'frontend.views.alljob.view_details': {
            'handlers': ['console','file_all_job_view_details'],
            'level': 'INFO',
        },#frontend.views.alljob.view_details'
    }
}
