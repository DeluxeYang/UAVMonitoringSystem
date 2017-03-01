#-*- coding: UTF-8 -*-   
from django.shortcuts import render_to_response,render,get_object_or_404  
from django.http import HttpResponse, HttpResponseRedirect  
from django.contrib import auth
from django.contrib import messages
from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required

from django.forms.formsets import formset_factory
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from common.forms.changepwdform import ChangepwdForm
from model.models import UAV_Model, Job, MyUser, UAV, UAV_Job_Detail, UAV_Job_Detail

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
@login_required
def changepwd(request):
    nowuser = request.user
    if request.method == 'GET':
        form = ChangepwdForm()
    else:
        form = ChangepwdForm(request.POST)
        if form.is_valid():
            username = request.user.username
            oldpassword = request.POST.get('oldpassword', '')
            user = auth.authenticate(username=username, password=oldpassword)
            if user is not None and user.is_active:
                newpassword = request.POST.get('newpassword1', '')
                user.set_password(newpassword)
                user.save()
                messages.success(request, "修改密码成功")
            else:
                messages.warning(request, "原密码输入错误")
        else:
            messages.warning(request, form.non_field_errors())
    return render_to_response('changepwd.html',{
        'self':nowuser,
        'form': form,
        },
        context_instance=RequestContext(request))
