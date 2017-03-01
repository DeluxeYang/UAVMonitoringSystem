from rtree import index
from random import random
from datetime import datetime
index_property = index.Property()
index_property.filename='TheIndex'#Rtree文件名称
index_property.buffering_capacity = 10
index_property.dimension = 2
index_property.storage=1
index_property.index_capacity = 4#Rtree节点容量
index_property.leaf_capacity = 4#Rtree叶子容量
index_property.set_near_minimum_overlap_factor(3)
index_property.fill_factor = 0.7#填充比例
index_property.pagesize = 4096
index_property.overwrite=False
index_name = "TheIndex"
idx = index.Index(index_name,properties=index_property)
idx.insert(id=110,coordinates=(2.0, 3.0, 3.0, 5.0),obj=10111)
for i in idx.leaves():
    print(i)
