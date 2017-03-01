import pymysql
import time
lng1=116.056177
lat1=40.443136
lng2=116.054345
lat2=40.448389
lng3=116.058349
lat3=40.448883
lng4=116.060738
lat4=40.444663
def get_incs(x1,y1,x2,y2,n,loop,flag):
    x_incs=(x2-x1)/n
    y_incs=(y2-y1)/n
    if flag%2==0:
        for i in range(loop):
            yield (x1+i*x_incs,y1+i*y_incs)
    else:
        for i in range(loop):
            yield (x2-i*x_incs,y2-i*y_incs)

def main():
    dic={}
    f = get_incs(lng1,lat1,lng4,lat4,5,6,0)
    k = get_incs(lng2,lat2,lng3,lat3,5,6,0)
    number = 1
    conn = pymysql.connect(host='localhost', port=3306,user='root',passwd="123456",db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)#以字典方式取数据
    cur = conn.cursor()
    time_delta = 10
    time_str = '2016-08-11 14:25:'+str(time_delta)
    time_now = time.strptime(time_str,"%Y-%m-%d %H:%M:%S")
    time_loop = time.strftime("%Y-%m-%d %H:%M:%S",time_now)
    job_detail_id = 15
    for u in f:
        x = next(k)
        g = get_incs(u[0],u[1],x[0],x[1],5,6,number)
        num = 1
        for i in g:
            if time_delta*num == 0:
                wtf = '00'
            elif time_delta*num == 60:
                wtf = '59'
            else:
                wtf = str(time_delta*num)
            time_str = '2016-08-11 14:2'+str(number)+':'+wtf
            time_now = time.strptime(time_str,"%Y-%m-%d %H:%M:%S")
            time_loop = time.strftime("%Y-%m-%d %H:%M:%S",time_now)
            print(str(number)+','+str(num),i)
            num = num + 1
            cur.execute("INSERT INTO `model_uav_job_desc`(detail_id,time,longitude,latitude,lng,lat,height,AGL,Compass) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')"
                %(job_detail_id,time_loop,116,44,i[0],i[1],0,0,0))
            #cursor.lastrowid
            insert_id = conn.insert_id()
            conn.commit()#向job_desc添加数据
        number = number + 1

    cur.close()
    conn.close()
        

main()