import os
import xlrd
import pymysql
import Geohash
def daaa():#读xls到数据库
    conn = pymysql.connect(host='localhost', port=3306,user='root',passwd='123456',db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)
    cur = conn.cursor()
    # id,code,province,city,district,parent,lng,lat,geohash,p_code_lng,p_code_lat,p_code
    # cur.execute("UPDATE `model_uav` SET time='%s',is_flying='1',last_job='%s' WHERE uav_id_code='%s'"%(time,job_number,uav_id_code))
    # conn.commit()
    fname = "geo.xls"
    bk = xlrd.open_workbook(fname)
    sh = bk.sheet_by_name("Sheet1")
    nrows = sh.nrows
    ncols = sh.ncols
    print(nrows,ncols)
    for i in range(1,nrows):
        code = int(sh.row_values(i)[2])
        center = sh.row_values(i)[4].split(',')
        lng = center[0]
        lat = center[1]
        level = sh.row_values(i)[5]
        if level == 'province' or level == 'city' or level == 'district':
            print(code,lng,lat,level)
            cur.execute("UPDATE `model_nation` SET lng='%s',lat='%s' WHERE code='%s'"%(lng,lat,code))
            conn.commit()
    cur.close()
    conn.close()

def dbbb():#数据库中的空行跟随parent行
    conn = pymysql.connect(host='localhost', port=3306,user='root',passwd='123456',db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)
    cur = conn.cursor()
    # id,code,province,city,district,parent,lng,lat,geohash,p_code_lng,p_code_lat,p_code
    # cur.execute("UPDATE `model_uav` SET time='%s',is_flying='1',last_job='%s' WHERE uav_id_code='%s'"%(time,job_number,uav_id_code))
    # conn.commit()
    cur.execute("SELECT * FROM `model_nation` WHERE lng is null")
    data = cur.fetchall()
    for i in data:
        data_id = i['id']
        parent = i['parent']
        cur.execute("SELECT * FROM `model_nation` WHERE id=%s"%parent)
        if not cur.rowcount:#cur长度，如果为0，则cur为空，没有找到对应数据，退出
           return
        p = cur.fetchone()
        lat = p['lat']
        lng = p['lng']
        print(lng,lat)
        cur.execute("UPDATE `model_nation` SET lng='%s',lat='%s' WHERE id='%s'"%(lng,lat,data_id))
        conn.commit()
    cur.close()
    conn.close()

def dccc():#数据处理
    conn = pymysql.connect(host='localhost', port=3306,user='root',passwd='123456',db='django',charset='UTF8',cursorclass=pymysql.cursors.DictCursor)
    cur = conn.cursor()
    cur.execute("SELECT * FROM `model_nation`")
    data = cur.fetchall()
    for i in data:
        data_id = i['id']
        parent = i['parent']
        lat = i['lat']
        lng = i['lng']
        geo = Geohash.geohash.encode(lat,lng,10)
        cur.execute("UPDATE `model_nation` SET geohash='%s' WHERE id='%s'"%(geo,data_id))
        conn.commit()
    cur.close()
    conn.close()

dccc()