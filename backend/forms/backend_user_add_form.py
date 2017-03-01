#-*- coding: UTF-8 -*-   
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
User = get_user_model()

LEVEL_CHOICES = (
    ('0', '0'),
    ('1', '1'),
    ('2', '2'),
    ('3', '3'),
    ('4', '4'),
    ('5', '5'),
    ('6', '6'),
    ('7', '7'),
)
class UserAddForm(forms.Form):
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
                'type':"email",
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
                'class':"form-control"
            }
        ),
    )

    headshot = forms.FileField(
        required=False,
        label=u"头像",
    )

    level = forms.IntegerField(
        required=False,
        label=u"权限",
        widget=forms.Select(
            choices=LEVEL_CHOICES,
            attrs={
                'placeholder':u"权限",
                'class':"form-control",
            }
        ),
    )

    is_admin = forms.BooleanField(
        required=False,
        label=u"is_admin",
        widget=forms.TextInput(
            attrs={
                'placeholder':u"is_admin",
                'class':"checkbox",
                'type':"checkbox",
            }
        ),
    )

    


    def clean(self):
        if not self.is_valid():
            raise forms.ValidationError(u"请修改以下错误")
        elif self.cleaned_data['password1'] != self.cleaned_data['password2']:
            raise forms.ValidationError(u"两次输入的密码不一样")
        else:
            cleaned_data = super(UserAddForm, self).clean()
        return cleaned_data

    def clean_username(self):
        users = User.objects.filter(username__iexact=self.cleaned_data["username"])
        '''验证重复昵称'''
        if not users:
            return self.cleaned_data["username"]
        raise forms.ValidationError(u"该昵称已经被使用请使用其他的昵称")
