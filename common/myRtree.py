from rtree import index
from model.models import *
index_name = "C:/uav/TheIndex"
def myRtree_overwrite():
    idx = index.Index(index_name,overwrite=True)#打开Rtree
    return idx
	
def myRtree():
    idx = index.Index(index_name)#打开Rtree
    return idx


def Rtree_Jobs_Recommend(user):
    #try:
        if user.nation:
            nation = Nation.objects.get(code=user.nation)
            lng,lat,j,temp,border_temp,count = nation.lng,nation.lat,{},{},{},0
            idx = myRtree()
            job_list = idx.nearest((lng, lat, lng, lat),5)
            job_list_enerator = Job_List_Generator(job_list)
            for job,job_borders in job_list_enerator:
                border_temp,num = {},0
                job_border_generator = Job_Border_Generator(job_borders)
                for job_border in job_border_generator:
                    border_temp[num] = {'lng':job_border.lng,'lat':job_border.lat}
                    num += 1
                district = Nation.objects.get(code=job.nation)
                city = Nation.objects.get(id=district.parent)
                province = Nation.objects.get(id=city.parent)
                temp = {'job_border':border_temp,'job_border_length':num,'number':job.number,'id':job.id,'username':job.user.username,'status':job.status,'job_type':job.job_type.type,'farm_type':job.farm_type.type,'start_time':job.start_time.strftime('%Y-%m-%d %H:%M:%S'),'each_pay':job.each_pay,'nation':str(province.province+','+city.city+','+district.district)}
                j[count] = temp
                count += 1
            j['length'] = count
            return j
        else:
           return False 
    #except:
        #return False
def Job_List_Generator(job_list):
    for i in job_list:
        job = Job.objects.get(id=i)
        job_borders= Job_Border.objects.filter(job_id=job.id)
        yield job,job_borders

def Job_Border_Generator(job_border):
    for i in job_border:
        yield i