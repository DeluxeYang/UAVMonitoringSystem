    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addPoint();
    }
    var length = 0;

    var job_detail_id = 0;

    var options = {//飞行记录点样式
            size: BMAP_POINT_SIZE_BIG,
            shape: BMAP_POINT_SHAPE_CIRCLE,
            color: 'rgba(255,0,0,0.0)'
        }
    var opts = {//信息窗口样式
        width : 200,
        height: 120,
        }
    
    //全局变量latest
    var count = 0;
    var latest;
    var latest_color;
    var opacity = 0.8;
    var line_w;
    var cross_border_flag = 0;
    var freq = 125;
    var frequence = 5000;


    var myIcon = new BMap.Icon("/static/flight_regular.png", new BMap.Size(21,25));
    //重写百度地图point 对象
/*  BMap.Point.prototype.time_c = ''
    BMap.Point.prototype.height_c = 0
    BMap.Point.prototype.id_c = 0
    BMap.Point.prototype.lng_l = 0
    BMap.Point.prototype.lat_l = 0
    BMap.Point.prototype.longitude = 0
    BMap.Point.prototype.latitude = 0*/
    BMap.Point.prototype.set_c_time_id = function(time,id,lng_l,lat_l){
        this.time_c = time;
        this.id_c = id;
        this.lng_l = lng_l;
        this.lat_l = lat_l;
    }
    BMap.Point.prototype.set_c = function(time,height){
        this.time_c = time;
        this.height_c = height;
    }
    BMap.Point.prototype.set_ll = function(longitude,latitude){
        this.longitude = longitude;
        this.latitude = latitude;
    }

    function getRotation(x1,y1,x2,y2){//1是最新点，2是次新点
        if(!x2){
            return 0;
        }
        var x;
        var y;
        var rotation;
        x = x1 - x2;
        y = y1 - y2;
        if((x1 < x2)&&(y1 > y2)){//最新点在次新点的左上角
            x = x2 - x1;
            y = y1 - y2;
            rotation = (180 * Math.atan(y/x)) / Math.PI + 270;
        }else if((x1 < x2)&&(y1 < y2)){//最新点在次新点的左下角
            x = x2 - x1;
            y = y2 - y1;
            rotation = (90 - (180 * Math.atan(y/x)) / Math.PI) + 180;
        }else if((x1 > x2)&&(y1 > y2)){//最新点在次新点的右上角
            x = x1 - x2;
            y = y1 - y2;
            rotation = (90 - (180 * Math.atan(y/x)) / Math.PI);
        }else if((x1 > x2)&&(y1 < y2)){//最新点在次新点的左下角
            x = x1 - x2;
            y = y2 - y1;
            rotation = (180 * Math.atan(y/x)) / Math.PI + 90;
        }else if(x1 == x2){
            if(y1 >= y2){
                rotation = 0;
            }else{
                rotation = 180;
            }
        }else if(y1 == y2){
            if(x1 > x2){
                rotation = 90;
            }else{
                rotation = 270;
            }
        }
        return rotation;
    }

    function addPoint(){
        $(function(){
            $.ajax({
                type:"GET",
                url:"/backend/index_ajax/",
                data:{},
                dataType:"json",
                success: function(data) {
                    var points = [];
                    for(var j=0;j<data['length'];j++){
                        var p1 = data[j].lng;
                        var p2 = data[j].lat;
                        var point = new BMap.Point(p1,p2);
                        points.push(point);
                        point.set_c_time_id(data[j].time,data[j].id,data[j].lng_l,data[j].lat_l);
                    }
                    map.clearOverlays()
                    
                    var point = new BMap.PointCollection(points, options);
                    map.addOverlay(point);
                    
                    point.addEventListener('click', function (e){
                        clearInterval(t);
                        Border_ajax(e.point.id_c);
                        setTimeout(Point_ajax(e.point.id_c),0);
                        map.openInfoWindow(new BMap.InfoWindow('飞行记录点'+
                            '<br>经度：' + e.point.lng + '<br>纬度：' + e.point.lat +
                             '<br>时间：' + e.point.time_c.substring(0,10) +' '+e.point.time_c.substring(11,19), opts),
                            new BMap.Point(e.point.lng,e.point.lat));
                    });
                    for(var j=0;j<data['length'];j++)
                    {
                        var marker = new BMap.Marker(points[j],{icon:myIcon});  // 创建标注
                        map.addOverlay(marker);
                        var rotation = getRotation(points[j].lng,points[j].lat,points[j].lng_l,points[j].lat_l)
                        marker.setRotation(rotation);//变方向
                    }
                }
            });
        });
    }
 
    function Border_ajax(u)
    {
        map.clearOverlays();
        $(function(){
            $.ajax({
                type:"GET",
                url:"/get_job_border_ajax/",
                data:{uav_id:u},
                dataType:"json",
                success: function(data){
                    var points = [];
                    var points_s = [];
                    for(var j=0;j<data['length'];j++){
                        var p1 = data[j].lng;
                        var p2 = data[j].lat;
                        points.push(new BMap.Point(p1,p2));
                    }
                    var polygon = new BMap.Polygon(points);
                    window.polygon = polygon;
                    map.addOverlay(polygon);
                    //polygon_zoom算法数据准备
                    var polygonVertices = [];//转为polygon_zoom可用的格式
                    for(var j=0;j<points.length;j++)
                    {
                        x = points[j].lng*100000;
                        y = points[j].lat*100000;
                        var temp = {x:x,y:y};
                        polygonVertices.push(temp);
                    }
                    polygon_zoom = createPolygon(polygonVertices);
                    paddingPolygon = createPaddingPolygon(polygon_zoom);//生成缩小的polygon
                    for(var j=0;j<paddingPolygon.vertices.length;j++)
                    {
                        x = paddingPolygon.vertices[j].x/100000;
                        y = paddingPolygon.vertices[j].y/100000;
                        points_s.push(new BMap.Point(x,y));
                    }
                    //至此，返回了缩小后的多边形坐标点
                    var polygon_s = new BMap.Polygon(points_s);
                    window.polygon_s = polygon_s;
                    
                }
            });
        });
    }


    function cross_border_detect(data)
    {//越界检测
        cross_border_flag = 0 ;
        var point_latest = new BMap.Point(data['latest'].lng, data['latest'].lat);
        point_latest.set_c(data['latest'].time,data['latest'].height);
        point_latest.set_ll(data['latest'].longitude,data['latest'].latitude)
        //检测最新点是否在多边形内，BMapLib，射线奇偶数法
        if(polygon.getPath().length == 0)
        {
            return;
        }
        result = BMapLib.GeoUtils.isPointInPolygon(point_latest,polygon);
        bounds = polygon_s.getBounds()
        result_s = bounds.containsPoint(point_latest)
        //BMapLib.GeoUtils.getDistance(Point, Point)
        if(!result){//在边界之外
            map.openInfoWindow(new BMap.InfoWindow('越界', {width : 50,height: 50,}),
                                point_latest);
        }
        else if (!result_s)
        {//在边界之内
            var locTime = new Date(data['latest'].time);
            var diffTime = 0;
            var point_s;
            if (data["length"]>1)//数据中有2条以上数据，因只有1条的话，它就是latest
            {//data[0] 是 latest
                var lng = data[1].lng;//仅使用次新数据
                var lat = data[1].lat;
                var time = data[1].time;
                var height = data[1].height;
                var preTime = new Date(time);

                diffTime = locTime - preTime;

                if (diffTime < 30000){ //单位毫秒，30s内为有效数据
                    if (checkLngLat(lng,lat))
                    {
                        point_s = new BMap.Point(lng,lat);
                        point_s.set_c(time,height);
                        point_latest.set_ll(data[1].longitude,data[1].latitude)
                    }
                }else{
                    return false;//没有有效数据来确定方向，30s条件不符
                }
                //至此，已有最新point_latest和次新数据point_s
                
                polygon_points = polygon.getPath();
                for (var i = 0; i < polygon_points.length; i++) {
                    cx = polygon_points[i].lng;
                    cy = polygon_points[i].lat;
                    if(i == polygon_points.length-1)
                    {//如果循环到最后一点，则d为循环回第一个点
                        dx = polygon_points[0].lng;
                        dy = polygon_points[0].lat;
                    }else{//如果没到最后一点，则d为下一个点
                        dx = polygon_points[i+1].lng;
                        dy = polygon_points[i+1].lat;
                    }
                    var ax = point_s.lng;
                    var ay = point_s.lat;
                    var bx = point_latest.lng;
                    var by = point_latest.lat;
                    var Molecular_1 = (ay-cy)*(dx-cx)-(ax-cx)*(dy-cy);
                    var Molecular_2 = (ay-cy)*(bx-ax)-(ax-cx)*(by-ay);
                    var Denominator = (bx-ax)*(dy-cy)-(by-ay)*(dx-cx);
                    var r = 0;
                    var s = 0;
                    var border_points = [];
                    border_points.push(new BMap.Point(cx,cy));
                    border_points.push(new BMap.Point(dx,dy));
                    var line = new BMap.Polyline(border_points,{strokeStyle:"solid",
                                strokeWeight:4,strokeColor:"#ff6633",strokeOpacity:0.8});
                    line_w = line;
                    
                    if(!Denominator)//如果 Denominator = 0 则平行
                    {
                        if(!Molecular_1)//如果 Molecular_1 = 0 则重合
                        {
                            //重合，发出警告
                            //退出循环
                            cross_border_flag = 1 ;
                            map.openInfoWindow(new BMap.InfoWindow('越界预警', {width : 50,height: 50,}),
                                point_latest);
                            break;
                        }//平行，不发出警告
                    }else{//不平行
                        r = Molecular_1 / Denominator;
                        s = Molecular_2 / Denominator;
                        if( s>0 && s<1 )//交点在该边界线段上
                        {
                            if( r>1 ){
                                //交点在记录点正方向延长线上
                                var newx = cx + s*(dx-cx);
                                var newy = cy + s*(dy-cy);
                                var point_new = new BMap.Point(newx,newy);
                                var distance = BMapLib.GeoUtils.getDistance(point_new, point_latest );
                                var speed = 0;
                                if(data['latest'].speed)
                                {
                                    speed = data['latest'].speed;
                                }else{
                                    point_s = new BMap.Point(lng,lat);
                                    point_s.set_c(time,height);
                                    point_latest.set_ll(data[1].longitude,data[1].latitude)
                                    var d = BMapLib.GeoUtils.getDistance(point_s, point_latest );
                                    speed = d/(diffTime/1000);
                                }
                                if((distance/speed) < 10)//如果最新点将在5s内越界
                                {
                                    cross_border_flag = 1 ;
                                    map.openInfoWindow(new BMap.InfoWindow('越界预警'+'</br>直线距离'+distance.toFixed(2)+'米', {width : 50,height: 50,}),
                                    point_latest);
                                }
                                break;
                            }//0<r<1交点在记录点线段上，不可能or point_s在外，latest在内，所以没有越界倾向，不警告
                            //r<0，反方向，不警告
                            //继续循环
                        }//不相交，不发出警告
                         //继续循环
                    }
                }
            }else{
                return false;//没有足够数据来确定方向，没有次新数据，注意此处运行于latest_detect()之后，即已经连接上次的数据
            }
        }
    }

    function line_setStrokeOpacity()
    {
        if(line_w)
        {
            if(cross_border_flag == 1){
                map.removeOverlay(line_w);
                line_w.setStrokeOpacity(opacity);
                map.addOverlay(line_w);
                opacity = opacity - 0.1;
                if(opacity <= 0)
                {
                    opacity = 0.8;
                }
            }else{
                map.removeOverlay(line_w);
            }
        }
    }


    function checkLngLat(lng, lat) 
    {
        // 在大陆范围内 检查经纬度
        var MaxLat = 60;
        var MinLat = 4;
        var MaxLng = 135;
        var MinLng = 73;
        return lng < MaxLng && lng > MinLng && lat < MaxLat && lat > MinLat;
    }

    function getRandomColor(){ 
        return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); 
    }

    function point_line_add(data, status)
    {//画出轨迹
        length = data['length']
        var preTime = new Date(data[length-1].time);
        var diffTime = 0;
        var travels = [];
        var tmpTravel = [];
        var points = [];
        for(var i=length-1;i>=0;i--){
            var lng = data[i].lng;
            var lat = data[i].lat;
            var time = data[i].time;
            var height = data[i].height;
            
            var locTime = new Date(time);
            diffTime = locTime - preTime;

            if (!(diffTime < 600000)){ //单位毫秒，两点之间相隔10分钟 进行分段处理
                travels.push(tmpTravel);
                tmpTravel = [];
            }
            if (checkLngLat(lng,lat)){
                var point = new BMap.Point(lng,lat);
                point.set_c(time,height);
                point.set_ll(data[i].longitude,data[i].latitude)
                points.push(point);
                tmpTravel.push(point)
            }
            preTime = locTime;
        };
        if (tmpTravel.length > 0){
            travels.push(tmpTravel);
        }

        var point = new BMap.PointCollection(travels[travels.length-1], options);
        map.addOverlay(point);

        color = getRandomColor();
        if(status==0)
        {
            latest_color = color;
        }
        var line = new BMap.Polyline(travels[travels.length-1],{strokeStyle:"solid",
            strokeWeight:4,strokeColor:latest_color,strokeOpacity:0.8});
        map.addOverlay(line);//画线

        point.addEventListener('mouseover', function (e)
        {
            map.openInfoWindow(new BMap.InfoWindow('飞行记录点'+
                '<br>经度：' + e.point.longitude + '<br>纬度：' + e.point.latitude +
                '<br>时间：' + e.point.time_c.substring(0,10) +' '+e.point.time_c.substring(11,19) + 
                '<br>高度：' + e.point.height_c+ '米', opts),
                new BMap.Point(e.point.lng,e.point.lat));
        });
        var point_latest = new BMap.Point(data['latest'].lng, data['latest'].lat);
        var marker = new BMap.Marker(point_latest,{icon:myIcon});  // 创建标注

        var rotation = getRotation(data[0].lng,data[0].lat,data[1].lng,data[1].lat)
        marker.setRotation(rotation);//变方向
   
        map.addOverlay(marker);
        
        if ( count == 0 ){
            var v = map.getViewport(travels[travels.length-1]);
            map.centerAndZoom(v.center,v.zoom);
        };
        count = 1;
    }

    function latest_detect(data)
    {//检测是否有数据更新
        if(latest){
            preTime = new Date(latest.time_c);
            locTime = new Date(data['latest'].time);
            if((locTime-preTime)>0){//比较latest和最新数据，如果不一样，继续执行
                var i = data["length"];
                locTime = new Date(data[i-1].time);//新数据中，时间最旧的一条
                diffTime = locTime - preTime;
                if (diffTime < 600000)
                {
                    var temp = new Object();
                    temp["lng"] = latest.lng;
                    temp["lat"] = latest.lat;
                    temp["time"] = latest.time_c;
                    temp["height"] = latest.height;
                    data[i] = temp;
                    data["length"] = i + 1;
                }//如果最新的数据的最旧一条数据，和原最新数据的时间差在10分钟内，则连成一条线
                var point = new BMap.Point(data['latest'].lng,data['latest'].lat);
                point.set_c(data[ 'latest'].time,data['latest'].height);
                point.set_ll(data['latest'].longitude,data['latest'].latitude)
                latest = point;
                if (diffTime < 600000)
                {//如果时间差在10分钟内，连成一条线，则保留原来的颜色
                    point_line_add(data,1);
                    setTimeout(cross_border_detect(data),200);
                }else{
                    point_line_add(data,0);//否则新的颜色
                    setTimeout(cross_border_detect(data),200);
                }
                return true;
            }else{//如果一样，即没有数据更新，退出
                return false;
            };
        }else{//如果latest为空，则是第一次运行{
            var point = new BMap.Point(data['latest'].lng,data['latest'].lat);
            point.set_c(data['latest'].time,data['latest'].height);
            point.set_ll(data['latest'].longitude,data['latest'].latitude)
            latest = point;
        }
        point_line_add(data,0);//有数据更新，则画点画线
        setTimeout(cross_border_detect(data),200);
        return true;
    }

    function uav_details(data)
    {
        document.getElementById("id_uav_details").style.display = "block";
        document.getElementById("id_uav_id_code").innerHTML = data['id'];
        document.getElementById("id_job_id").innerHTML = data['job'];
        document.getElementById("id_time").innerHTML = data['latest'].time.substr(0,10)+"\n"+data['latest'].time.substr(11,8);
        document.getElementById("id_height").innerHTML = data['latest'].height+'米';
        document.getElementById("id_longitude").innerHTML = data['latest'].longitude;
        document.getElementById("id_latitude").innerHTML = data['latest'].latitude;
        document.getElementById("id_AGL").innerHTML = data['latest'].AGL+'米';
        if(data['latest'].compass){
            document.getElementById("id_compass").innerHTML = data['latest'].compass;
        }else{
            document.getElementById("id_compass").innerHTML = '暂无数据';
        }
        if(data['latest'].VNorth == ''){
            document.getElementById("id_uav_details_thr_ss").style.display = "block";
            document.getElementById("id_VNorth").innerHTML = data['latest'].VNorth;
            document.getElementById("id_VEast").innerHTML = data['latest'].VEast;
            document.getElementById("id_VDown").innerHTML = data['latest'].VDown;
            document.getElementById("id_TAS").innerHTML = data['latest'].TAS;
            document.getElementById("id_ROLL").innerHTML = data['latest'].ROLL;
            document.getElementById("id_PITCH").innerHTML = data['latest'].PITCH;
            document.getElementById("id_YAW").innerHTML = data['latest'].YAW;
            document.getElementById("id_FuelFlow").innerHTML = data['latest'].FuelFlow;
            document.getElementById("id_Fuel").innerHTML = data['latest'].Fuel;
            document.getElementById("id_MainPowerV").innerHTML = data['latest'].MainPowerV;
            document.getElementById("id_MainPowerA").innerHTML = data['latest'].MainPowerA;
            document.getElementById("id_ServoPowerV").innerHTML = data['latest'].ServoPowerV;
            document.getElementById("id_ServoPowerA").innerHTML = data['latest'].ServoPowerA;
            document.getElementById("id_BoardT").innerHTML = data['latest'].BoardT;
        }
    }

    function Point_ajax(u)
    {
        var time_c;
        if(latest){
            var time_c = latest.time_c;
        }
        $(function(){
            $.ajax({
                type:"GET",
                url:"/backend/index_ajax/",
                data:{uav_id:u,latest:time_c},
                dataType:"json",
                success: function(data)  {
                    latest_detect(data);
                    uav_details(data);
                }
            });
        });
        clearInterval(t);
        t = setInterval('Point_ajax("'+u+'")', 10000);  //每5秒刷新数据
    }

    function baiduMap_reset()
    {
        clearInterval(t);
        initMap();
        count = 0;
        t = setInterval('addPoint()',10000);
        latest = '';
    }

    window.onload = initMap;//创建和初始化地图
    t = setInterval('addPoint()',10000);  //刷新数据

    window.setInterval('line_setStrokeOpacity()',freq)