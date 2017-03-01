#-*- coding: UTF-8 -*-   
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
User = get_user_model()


class ChangepwdForm(forms.Form):
    oldpassword = forms.CharField(
        required=True,
        label=u"原密码",
        error_messages={'required': u'请输入原密码'},
        widget=forms.PasswordInput(
            attrs={
                'placeholder':u"原密码",
                'class':"form-control",
            }
        ),
    ) 
    newpassword1 = forms.CharField(
        required=True,
        label=u"新密码",
        error_messages={'required': u'请输入新密码'},
        widget=forms.PasswordInput(
            attrs={
                'placeholder':u"新密码",
                'class':"form-control",
            }
        ),
    )
    newpassword2 = forms.CharField(
        required=True,
        label=u"确认密码",
        error_messages={'required': u'请再次输入新密码'},
        widget=forms.PasswordInput(
            attrs={
                'placeholder':u"确认密码",
                'class':"form-control",
            }
        ),
    )
    def clean(self):
        if not self.is_valid():
            raise forms.ValidationError(u"请修改以下错误")
        elif self.cleaned_data['newpassword1'] != self.cleaned_data['newpassword2']:
            raise forms.ValidationError(u"两次输入的新密码不一样")
        else:
            cleaned_data = super(ChangepwdForm, self).clean()
        return cleaned_data