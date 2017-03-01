from rtree import index
from random import random
from datetime import datetime
# idx = index.Index()
# left,bottom,right,top = (0.0,0.0,1.0,1.0)
# idx.insert(id=0,coordinates=(2.0, 3.0, 3.0, 5.0),obj=10000)
# print(idx.bounds)
# idx.insert(id=1,coordinates=(4.0, 6.0, 5.0, 7.0),obj=10001)
# print(idx.bounds)
# idx.insert(id=2,coordinates=(7.0, 2.0,10.0, 3.0),obj=10002)
# print(idx.bounds)
# idx.delete(id=2,coordinates=(7.0, 2.0,10.0, 3.0))
# print(idx.bounds)
# idx.insert(id=3,coordinates=(7.0, 2.0,11.0, 3.0),obj=10003)
# print(idx.bounds)
# idx.insert(id=4,coordinates=idx.bounds,obj=10004)
# print(idx.bounds)
# # print(list(idx.intersection((1.0, 1.0, 2.0, 2.0))))
# # print(list(idx.intersection((1.0000001, 1.0000001, 2.0, 2.0))))
# # print(list(idx.nearest((1.0000001, 1.0000001, 2.0, 2.0), 4)))
# # hits = list(idx.intersection((0, 0, 60, 60), objects=True))
# # for item in hits:
# #     print(item.object, item.bbox)

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
now1 = datetime.now()
print(now1)
idx = index.Index(  index_name,properties=index_property,overwrite=True)
rands = [random() for i in range(100000)]
def generator_function():
    for i, coord in enumerate(rands):
        yield (i, (coord, coord+1, coord, coord+1), coord)
now2 = datetime.now()
print(now2)
print(now2-now1)

# idx.insert(id=0,coordinates=(2.0, 3.0, 3.0, 5.0),obj=10000)

# idx.insert(id=1,coordinates=(4.0, 6.0, 5.0, 7.0),obj=10001)

# idx.insert(id=2,coordinates=(7.0, 2.0,10.0, 3.0),obj=10002)

# idx.insert(id=3,coordinates=(6.0, 4.0, 8.0, 6.0),obj=10003)

# idx.insert(id=4,coordinates=(9.0, 6.0,10.0, 8.0),obj=10004)

# idx.insert(id=5,coordinates=(1.0, 7.0, 2.0, 8.0),obj=10005)

# idx.insert(id=6,coordinates=(3.0, 0.0, 4.0, 1.0),obj=10006)

# idx.insert(id=7,coordinates=(8.0, 6.0, 9.0, 7.0),obj=10007)

# idx.insert(id=8,coordinates=(5.0, 3.0, 6.0, 4.0),obj=10008)

# idx.insert(id=9,coordinates=(9.0, 3.0,10.0, 4.0),obj=10009)

# idx.insert(id=10,coordinates=(0.0, 0.0, 1.0, 1.0),obj=10010)

# idx.insert(id=11,coordinates=(8.0, 0.0, 9.0, 1.0),obj=10011)

# idx.insert(id=12,coordinates=(5.0, 2.0, 6.0, 3.0),obj=10012)

# print( idx.properties)

# for i in idx.leaves():
#     print(i)

