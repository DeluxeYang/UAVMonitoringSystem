#-*- coding: UTF-8 -*-   
from django import forms
from django.contrib.auth.models import User
from model.models import *
from django.contrib.auth import get_user_model
User = get_user_model()


class UavModelAddForm(forms.Form):
    uav_model = forms.CharField(
        required=True,
        label=u"无人机模型编号",
        error_messages={'required': '请输入无人机模型编号'},
        widget=forms.TextInput(
            attrs={
                'placeholder':u"模型编号",
                'class':"form-control",
            }
        ),
    )

    name = forms.CharField(
        required=True,
        label=u"无人机型号名",
        error_messages={'required': '请输入无人机型号名'},
        widget=forms.TextInput(
            attrs={
                'placeholder':u"模型名",
                'class':"form-control",
            }
        ),
    )

    function_type = forms.CharField(
        required=False,
        label=u"功能类型",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"功能类型",
                'class':"form-control",
            }
        ),
    )

    serial_number = forms.CharField(
        required=False,
        label=u"产品编号",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"产品编号",
                'class':"form-control",
            }
        ),
    )

    company = forms.CharField(
        required=False,
        label=u"公司",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"公司",
                'class':"form-control",
            }
        ),
    )

    origin_place = forms.CharField(
        required=False,
        label=u"产地",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"产地",
                'class':"form-control",
            }
        ),
    )

    design_date = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    weight = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    load_weight = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    diagonal_distance = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    propeller_num = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    max_rise = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    max_decline = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    max_speed = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    max_height = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    max_angle = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    precision_v = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    precision_h = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    GPS_mode = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    signal_mode = forms.CharField(
        required=False,
        label=u" ",
        widget=forms.TextInput(
            attrs={
                'placeholder':u" ",
                'class':"form-control",
            }
        ),
    )

    other = forms.CharField(
        required=False,
        label=u"其他",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"其他",
                'class':"form-control",
            }
        ),
    )

    def clean(self):
        if not self.is_valid():
            raise forms.ValidationError(u"请修改以下错误")
        else:
            cleaned_data = super(UavModelAddForm, self).clean()
        return cleaned_data

    def clean_uav_model(self):
        uavmodel = UAV_Model.objects.filter(uav_model__iexact=self.cleaned_data["uav_model"])
        '''验证重复昵称'''
        if not uavmodel:
            return self.cleaned_data["uav_model"]
        raise forms.ValidationError(u"该模型编号已存在")