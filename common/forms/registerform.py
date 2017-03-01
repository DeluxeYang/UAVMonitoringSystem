#-*- coding: UTF-8 -*-   
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
User = get_user_model()


class RegisterForm(forms.Form):
    username = forms.CharField(
        required=True,
        label=u"用户名",
        error_messages={'required': '请输入用户名'},
        widget=forms.TextInput(
            attrs={
                'placeholder':u"用户名",
                'class':"form-control",
            }
        ),
    )

    email = forms.EmailField(
        required=True,
        label=u"邮箱",
        error_messages={'required': '请输入邮箱'},
        widget=forms.TextInput(
            attrs={
                'placeholder':u"邮箱地址",
                'class':"form-control",
            }
        ),
    )    

    password1 = forms.CharField(
        required=True,
        label=u"密码",
        error_messages={'required': u'请输入密码'},
        widget=forms.PasswordInput(
            attrs={
                'placeholder':u"密码",
                'class':"form-control",
            }
        ),
    )
    password2 = forms.CharField(
        required=True,
        label=u"确认密码",
        error_messages={'required': u'请再次输入密码'},
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
        elif self.cleaned_data['password1'] != self.cleaned_data['password2']:
            raise forms.ValidationError(u"两次输入的密码不一样")
        else:
            cleaned_data = super(RegisterForm, self).clean()
        return cleaned_data

    def clean_username(self):
        users = User.objects.filter(username__iexact=self.cleaned_data["username"])
        '''验证重复昵称'''
        if not users:
            return self.cleaned_data["username"]
        raise forms.ValidationError(u"该昵称已经被使用请使用其他的昵称")
