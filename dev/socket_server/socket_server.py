#!user/bin/env python3  
# -*- coding: utf-8 -*- 
import os
import socketserver
from socketserver import StreamRequestHandler as SRH
import time
import pymysql
import configparser
import pymysql
from urllib.request import urlopen
config = configparser.ConfigParser()
config.readfp(open('uav_server.ini'))
ip = config.get("ip_addr", "ip")
ip_port = int(config.get("ip_addr", "port"))
host = config.get("mysql", "host")
port = int(config.get("mysql", "port"))
user = config.get("mysql", "user")
passwd = config.get("mysql", "passwd")
addr = (ip,ip_port)
print("Socket Running At: ",ip,":",ip_port)
try:
    conn = pymysql.connect(host=host, port=port,user=user,passwd=passwd,db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)#以字典方式取数据
    cur = conn.cursor()
    cur.close()
    conn.close()
except:
    print("MySQL Connect Error, Please Check server.ini File")
    time.sleep(3)
    os._exit(0)

def resolve_data(self,data_recv,time_now):
    data = data_recv.decode('utf-8')
    if data.startswith('#') & data.endswith('*'):
        #E,116.350058,N,40.006177,3.29,0.00,3.29,0.00,3.29,3.29,3.29,3.29*
        data_list = data[1:-1].split(',')
        
        UAV_ID_CODE = data_list[0]
        JOB_NUMBER = data_list[1]
        TIME = timestamp_datetime(float(data_list[2])/1000)

        WorE = data_list[3]
        longitude = data_list[4]
        NorS = data_list[5]
        latitude = data_list[6]

        Height = data_list[7]
        AGL = data_list[8]
        Compass = data_list[9]

        Voltage_1 = data_list[10]
        Voltage_2 = data_list[11]
        Voltage_3 = data_list[12]
        Voltage_4 = data_list[13]
        Voltage_5 = data_list[14]
        Voltage_6 = data_list[15]
        Voltage_7 = data_list[16]
        Voltage_8 = data_list[17]

        data_str = "\n\t经度"+WorE+"："+longitude+"\t纬度"+NorS+"："+latitude+"\n\t海拔："+Height+"米\t离地："+AGL+"米\t磁方向："+Compass+"\n\tVoltage_1"+Voltage_1 +"\tVoltage_2"+Voltage_2 +"\n\tVoltage_3"+Voltage_3 +"\tVoltage_4"+Voltage_4 +"\n\tVoltage_5"+Voltage_5 +"\tVoltage_6"+Voltage_6 +"\n\tVoltage_7"+Voltage_7 +"\tVoltage_8"+Voltage_8+"\n"
        print(data_str)

        try:
            fo_name = "SerialPortLog"+time.strftime('%Y-%m-%d')[0:10]+".txt"
            fo = open(fo_name,"a")
            fo.write(str(time_now)+"\tGOT Connection From "+str(self.client_address)+"\t"+data_str)
            fo.close()

            conn = pymysql.connect(host=host, port=port,user=user,passwd=passwd,db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)
            cur = conn.cursor()

            #######uav
            
            cur.execute("SELECT id FROM `model_uav` WHERE uav_id_code='%s'"%UAV_ID_CODE)
            if not cur.rowcount:#cur长度，如果为0，则cur为空，没有找到对应数据，退出
                print(time_now,"\tSELECT uav_id Error From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)
                return
            uav_id = cur.fetchone()['id']

            #######job
            
            cur.execute("SELECT id FROM `model_job` WHERE number='%s'"%JOB_NUMBER)
            if not cur.rowcount:#cur长度，如果为0，则cur为空，没有找到对应数据，退出
                print(time_now,"\tSELECT job_id Error From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)
                return
            job_id = cur.fetchone()['id']

            #######uav_job_detail

            cur.execute("SELECT * FROM `model_uav_job_detail` WHERE uav_id='%s' AND job_id='%s'"%(uav_id,job_id))
            if not cur.rowcount:#cur长度，如果为0，则cur为空，没有找到对应该uav和job对应的job_detail，退出
                print(time_now,"\tSELECT uav_job_detail Error: There is no Record. From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)
                return
            job_detail = cur.fetchone()
            if not job_detail['confirm']:#检验confirm位
                print(time_now,"\tSELECT uav_job_detail Error: THE Record is NOT Confirmed. From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)
                return

            #######百度API坐标转换，GPS转百度坐标

            u = urlopen("http://api.map.baidu.com/geoconv/v1/?coords=%s,%s&from=1&to=5&ak=upTvjM7vTHHlXckl6gxFkndl"%(longitude,latitude))
            baidu_s = eval(u.read())
                   #status:0_表示正常，其他表示异常
            #print(baidu_s)
            for i in range(3):#最多3次
                if baidu_s['status']:#如果异常，重新获取
                    u = urlopen("http://api.map.baidu.com/geoconv/v1/?coords=%s,%s&from=1&to=5&ak=upTvjM7vTHHlXckl6gxFkndl"%(longitude,latitude))
                    baidu_s = eval(u.read())
                else:
                    break

            insert_id = 0
            #######保存数据库
            if not baidu_s['status']:#转换坐标成功，保存所有数据
                cur.execute("INSERT INTO `model_uav_job_desc`(detail_id,time,longitude,latitude,lng,lat,height,AGL,Compass) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')"
                    %(job_detail['id'],TIME,longitude,latitude,baidu_s['result'][0]['x'],baidu_s['result'][0]['y'],Height,AGL,Compass))
                #cursor.lastrowid
                insert_id = conn.insert_id()
                conn.commit()#向job_desc添加数据
            else:#转换坐标失败,保存原数据
                cur.execute("INSERT INTO `model_uav_job_desc`(detail_id,time,longitude,latitude,lng,lat,height,AGL,Compass) VALUES ('%s','%s','%s','%s', '0', '0','%s','%s','%s')"
                    %(job_detail['id'],TIME,longitude,latitude,Height,AGL,Compass))
                insert_id = conn.insert_id()
                conn.commit()#向job_desc添加数据
                print(time_now,"\tBaiduMap Geo Data Transform Error: ",baidu_s['status'],". From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)

            cur.execute("UPDATE `model_uav` SET time='%s',is_flying='1',last_job='%s' WHERE uav_id_code='%s'"%(TIME,JOB_NUMBER,UAV_ID_CODE))
            conn.commit()#向uav更新数据数据,is_flying,last_job,time
            print(time_now,"\tSucceed THR. From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)
        except:
            print(time_now,"\tFailed THR. From ",addr,",UAV_ID_CODE:",UAV_ID_CODE)


def timestamp_datetime(v):
    format = '%Y-%m-%d %H:%M:%S'
    value = time.localtime(v)
    dt = time.strftime(format, value)
    return dt


class Servers(SRH):
    def handle(self):
        time_now = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(time.time()))
        print (time_now,"\tGOT Connection From ",self.client_address)
        while True:  
            data_recv = self.request.recv(1024)
            if not data_recv:
                break
            try:
                print(time_now,"\tReceived Data From",self.client_address)
                #resolve_data(self,data_recv,time_now)
            except:
                print(time_now,"\tReceived Error From",self.client_address)

            

print ('server is running....')
server = socketserver.ThreadingTCPServer(addr,Servers)
server.serve_forever()