#-*- coding: UTF-8 -*-
# from rtree import index
# from random import random
# from celery import task
# import django
# from django.template.context import RequestContext
# import datetime
# from model.models import *
# from django.contrib.auth import get_user_model
# django.setup()#不加这个会出错，models aren't loaded yet
# User = get_user_model()

def Get_Coords():
	lat = 39.928167
	a = -90
	c = 90
	s = ""
	for i in range(8):
		b = ( a + c ) / 2
		if lat > b :
			s = s + '1'
			a = b
		else:
			s = s + '0'
			c = b
	print(s)

Get_Coords()