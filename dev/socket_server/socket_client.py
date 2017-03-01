from socket import *
import time
host = '202.205.84.172'
port = 8000
addr = (host,port)

client = socket(AF_INET,SOCK_STREAM)
client.connect(addr)
bufsize = 1024

minLon = 116.345336
minLat = 40.000522
maxLon = 116.358122
maxLat = 40.006352

def main():
    lngNum = 0.9
    latNum = 0.9
    lngFlag = 0
    latFlag = 0
    lat = ( minLat + maxLat ) / 2
    lng = ( minLon + maxLon ) / 2
    lat = 40.000042
    lng = 116.347052
    count = 0
    while True:
        now = str(int(time.time())*1000)
        data = "#Deluxe20150513,Deluxe20150513,%s,E,%s,N,%s,300,300,0,3.29,0.00,3.29,0.00,3.29,3.29,3.29,3.29*"%(now,lng,lat)
        print(data)
        print()
        client.send(data.encode('utf-8')) 
        if count == 14:
            time.sleep(5)
            lng -= 0.0005
        elif count > 14 and count < 28:
            lng -= 0.0005
        elif count == 28:
            time.sleep(5)
            lat -= 0.0003
            lng += 0.0005
        elif count > 30 and count < 45:
            lat -= 0.0003
            lng += 0.0005
        elif count == 45:
            time.sleep(5)
            lat += 0.0003
            lng += 0.0008
        elif count == 48:
            time.sleep(5)
            lat += 0.0003
            lng -= 0.0006
        elif count > 48 and count < 64:
            lat += 0.0003
            lng -= 0.0006
        elif count == 64:
            time.sleep(5)
            lat -= 0.0002
        elif count >= 64 and count < 94:
            lat -= 0.0002
        elif count == 94:
            time.sleep(5)
            lat = 40.000042
            lng = 116.347052
            count = 1
        else:
            lat += 0.0003
            lng += 0.0005
        time.sleep(1)
        count += 1



if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:  
        if client != None:  
            client.close()
