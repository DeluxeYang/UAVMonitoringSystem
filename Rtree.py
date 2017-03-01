from rtree import index
from common.myRtree import *
idx = myRtree()
for i in idx.leaves():
    print(i)
