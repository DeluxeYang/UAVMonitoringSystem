    //重写百度地图point 对象
    //BMap.Point.prototype.time_c = ''
    //BMap.Point.prototype.height_c = 0
    //BMap.Point.prototype.longitude = 0
    //BMap.Point.prototype.latitude = 0
    BMap.Point.prototype.set_c = function(time,height){
        this.time_c = time;
        this.height_c = height;
    }
    BMap.Point.prototype.set_ll = function(longitude,latitude){
        this.longitude = longitude;
        this.latitude = latitude;
    }
    var options = {//飞行记录点样式
            size: BMAP_POINT_SIZE_BIG,
            shape: BMAP_POINT_SHAPE_CIRCLE,
            color: 'rgba(255,0,0,0)'
            }
    var opts = {//信息窗口样式
                width : 200,
                height: 100,
                }
    var border_opts = {//信息窗口样式
                width : 200,
                height: 100,
                }
    var myIcon = new BMap.Icon("/static/flight_regular.png", new BMap.Size(21,25));

    //全局变量latest
    var latest;
    var latest_color;
    var opacity = 0.8;
    var line_w;
    var cross_border_flag = 0;
    var freq = 125;
    var frequence = 4000;
    var MP_Roof = 0;
    var time_warning = 10;

    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addPolygon(job_border_json);
        Point_ajax();
        check_frequence();
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
    function addPolygon(PPoint)
    {
        var points = [];
        for(var j=0;j<PPoint.length;j++){
            var p1 = PPoint[j].fields.lng;
            var p2 = PPoint[j].fields.lat;
            points.push(new BMap.Point(p1,p2));
        }
        var viewport = map.getViewport(points);
        var polygon = new BMap.Polygon(points);
        window.polygon = polygon;
        window.polygon_points = points;
        map.addOverlay(polygon);
        polygon.disableMassClear();
        map.centerAndZoom(viewport.center,viewport.zoom);//设定地图的中心点和坐标并将地图显示在地图容器中 
        addSafePolygon(points,AreaCalMarginPadding());
    }

    function AreaCalMarginPadding()
    {//由面积计算 内缩 距离
        var PolugonArea = BMapLib.GeoUtils.getPolygonArea(polygon);
        window.MarginPadding = Math.round(Math.sqrt(PolugonArea)/10);
        MarginPadding = MarginPaddingLevel(MarginPadding);
        console.log("安全边界的内缩倍数为"+MarginPadding);
        return MarginPadding;
    }

    function MarginPaddingLevel(distance)
    {
        if(distance > 55)
            distance = 60;
        else if(distance > 45)
            distance = 50;
        else if(distance > 35)
            distance = 40;
        else if(distance > 25)
            distance = 30;
        else if(distance > 15)
            distance = 20;
        else
            distance = 10;
        return distance;
    }

    function dynamicSafePolygon(data,time)
    {
        var speed = calSpeed(data);
        if(speed > 0){
            console.log('speed:::::::'+speed)
            var distance = speed * time_warning;
            console.log('distance:::::::'+distance)
            console.log('MarginPadding:::::::'+MarginPadding)
            distance = MarginPaddingLevel(distance);
            if(distance != MarginPadding){
                console.log("重建polygon_s,内缩倍数"+distance);
                addSafePolygon(polygon_points,distance);
                MarginPadding = distance;
            }
        }
    }

    function calSpeed(data)
    {
        var speed = -1;
        if(data['latest'])
        {
            var point_latest = new BMap.Point(data['latest'].lng, data['latest'].lat);
            point_latest.set_c(data['latest'].time,data['latest'].height);
            point_latest.set_ll(data['latest'].longitude,data['latest'].latitude)
            if (data["length"]>1)//数据中有2条以上数据，因只有1条的话，它就是latest
            {//data[0] 是 latest
                var point_s = new BMap.Point(data[1].lng, data[1].lat);
                point_s.set_c(data[1].time,data[1].height);
                point_s.set_ll(data[1].longitude,data[1].latitude)
                var d = BMapLib.GeoUtils.getDistance(point_s, point_latest);
                var preTime = new Date(data[1].time);
                var locTime = new Date(data['latest'].time);
                diffTime = locTime - preTime;
                speed = d/(diffTime/1000);
            }
            if(data['latest'].speed)
            {//data数据中的speed为GPS数据，优先级高
                speed = data['latest'].speed;
            }
        }
        return speed;
    }

    function addSafePolygon(points,MarginPadding)
    {
        if(MarginPadding < 10)
            return false;
        var points_s = [];
        var temp_point;
        var result;
        var flag = true;
        //polygon_zoom算法数据准备
        //转为polygon_zoom可用的格式
        var polygonVertices = [];
        for(var j=0;j<points.length;j++)
        {
            x = points[j].lng*100000;
            y = points[j].lat*100000;
            var temp = {x:x,y:y};
            polygonVertices.push(temp);
        }

        var polygon_zoom = createPolygon(polygonVertices);
        //createPaddingPolygon
        paddingPolygon = createPaddingPolygon(polygon_zoom,MarginPadding);
        for(var j=0;j<paddingPolygon.vertices.length;j++){
            x = paddingPolygon.vertices[j].x/100000;
            y = paddingPolygon.vertices[j].y/100000;
            temp_point = null;
            temp_point = new BMap.Point(x,y);
            points_s.push(temp_point);
            result = BMapLib.GeoUtils.isPointInPolygon(temp_point,polygon);
            if(!result){
                console.log("paddingPolygon"+j);
                flag = false;
                break;
            }
        }if(!flag){//抵消多边形边界点顺时针&逆时针的差异
            points_s = [];
            flag = true;
            marginPolygon = createMarginPolygon(polygon_zoom,MarginPadding);
            for(var j=0;j<marginPolygon.vertices.length;j++){
                x = marginPolygon.vertices[j].x/100000;
                y = marginPolygon.vertices[j].y/100000;
                temp_point = null;
                temp_point = new BMap.Point(x,y);
                points_s.push(temp_point);
                result = BMapLib.GeoUtils.isPointInPolygon(temp_point,polygon);
                if(!result){
                    console.log("marginPolygon"+j);
                    flag = false;
                    break;
                }
            }
        }
        if(!flag){
            if(addSafePolygon(points,MarginPadding-10)){
                return true;
            }else{
                return false;//SafePolygon超出原边界，不可用
            }
        }
        //至此，返回了缩小后的多边形坐标点
        window.polygon_s = null;
        window.polygon_s = new BMap.Polygon(points_s);
        //map.addOverlay(window.polygon_s);
        return true;
    }

    function cross_border_detect(data)
    {//越界检测
        cross_border_flag = 0 ;
        var point_latest = new BMap.Point(data['latest'].lng, data['latest'].lat);
        point_latest.set_c(data['latest'].time,data['latest'].height);
        point_latest.set_ll(data['latest'].longitude,data['latest'].latitude)
        //检测最新点是否在多边形内，BMapLib，射线奇偶数法
        if(polygon.getPath().length == 0)
        {//无可用边界
            return;
        }
        try{
            if(polygon_s)
            {//如果安全边界可用，检测是否在安全边界之内，在则不越界检测，退出
                result_s = BMapLib.GeoUtils.isPointInPolygon(point_latest,polygon_s);
                if(result_s)
                    return;
            }
        }catch(e){}//如果安全边界不可用，继续执行

        result = BMapLib.GeoUtils.isPointInPolygon(point_latest,polygon);
        //BMapLib.GeoUtils.getDistance(Point, Point)
        if(!result){//在边界之外
            map.openInfoWindow(new BMap.InfoWindow('越界', {width : 50,height: 50,}),
                                point_latest);
            return;
        }
        
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
                    point_s.set_ll(data[1].longitude,data[1].latitude)
                }
            }else{
                return false;//没有有效数据来确定方向，30s条件不符
            }
            
            //至此，已有最新point_latest和次新数据point_s

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
                
                if(!Denominator)//如果 Denominator = 0 则平行
                {
                    if(!Molecular_1)//如果 Molecular_1 = 0 则重合
                    {
                        //重合，发出警告
                        //退出循环
                        cross_border_flag = 1 ;
                        map.openInfoWindow(new BMap.InfoWindow('越界预警', {width : 50,height: 50,}),point_latest);
                        map.removeOverlay(line_w);
                        line_w = new BMap.Polyline(border_points,{strokeStyle:"solid",
                            strokeWeight:4,strokeColor:"#ff6633",strokeOpacity:0.8});
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
                                var d = BMapLib.GeoUtils.getDistance(point_s, point_latest);
                                speed = d/(diffTime/1000);
                            }
                            if((distance/speed) < time_warning)//如果最新点将在10s内越界
                            {
                                cross_border_flag = 1 ;//闪烁
                                map.openInfoWindow(new BMap.InfoWindow('越界预警'+'</br>直线距离'+distance.toFixed(2)+'米', {width : 50,height: 50,}),point_latest);
                                map.removeOverlay(line_w);
                                line_w = new BMap.Polyline(border_points,{strokeStyle:"solid",
                                    strokeWeight:4,strokeColor:"#ff6633",strokeOpacity:0.8});
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

    function line_setStrokeOpacity()
    {
        map.removeOverlay(line_w);
        if(line_w)
        {
            if(cross_border_flag == 1){
                line_w.setStrokeOpacity(opacity);
                map.addOverlay(line_w);
                opacity = opacity - 0.1;
                if(opacity <= 0)
                {
                    opacity = 0.8;
                }
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
    {//画出边界
        length = data['length']
        var preTime = new Date(data[length-1].time);
        var diffTime = 0;
        var travels = [];
        var tmpTravel = [];
        var points = [];
        //轨迹分段
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
        //将每一段轨迹分别绘制
        for(var i=0;i<travels.length;i++)
        {
            var point = new BMap.PointCollection(travels[i], options);
            map.addOverlay(point);

            color = getRandomColor();
            if(status==0){
                latest_color = color;
            }
            status=0;//////???????
            var line = new BMap.Polyline(travels[i],{strokeStyle:"solid",
                strokeWeight:4,strokeColor:latest_color,strokeOpacity:0.8});
            map.addOverlay(line);//画线

            point.addEventListener('mouseover', function (e)
            {
                map.openInfoWindow(new BMap.InfoWindow('飞行记录点'+
                    '<br>经度：' + e.point.longitude + '<br>纬度：' + e.point.latitude +
                    '<br>时间：' + e.point.time_c.substring(0,10) +' '+e.point.time_c.substring(11,19) + 
                    '<br>高度：' + e.point.height_c/100+ '米', opts),
                    new BMap.Point(e.point.lng,e.point.lat));
            });
        }
        if(window.marker)
            map.removeOverlay(window.marker)
        var marker = new BMap.Marker(latest,{icon:myIcon});  // 创建标注
        window.marker = marker

        var rotation = 0
        if(data[1])
            rotation = getRotation(data[0].longitude,data[0].latitude,data[1].longitude,data[1].latitude)
        window.marker.setRotation(rotation);//变方向
        map.addOverlay(window.marker);
    }

    function latest_detect(data)
    {//检测是否有数据更新
        if(latest){//如果latest，则不是第一次运行{
            preTime = new Date(latest.time_c);
            locTime = new Date(data['latest'].time);
            if((locTime-preTime)>0){//比较latest和最新数据，如果不一样，继续执行
                var i = data["length"];
                locTime = new Date(data[i-1].time);//新数据中，时间最旧的一条
                diffTime = locTime - preTime;
                var point = new BMap.Point(data['latest'].lng,data['latest'].lat);
                point.set_c(data['latest'].time,data['latest'].height);
                point.set_ll(data['latest'].longitude,data['latest'].latitude)
                if (diffTime < 600000){
                //如果最新数据中的最旧一条数据，和原最新数据的时间差在10分钟内，则连成一条线
                    var temp = new Object();
                    temp["lng"] = latest.lng;
                    temp["lat"] = latest.lat;
                    temp["time"] = latest.time_c;
                    temp["height"] = latest.height;
                    temp["longitude"] = latest.longitude;
                    temp["latitude"] = latest.latitude;
                    data[i] = temp;
                    data["length"] = i + 1;
                    latest = point;
                    point_line_add(data,1);//连成一条线
                    setTimeout(cross_border_detect(data),200);//越界检测
                }else{
                    latest = point;
                    point_line_add(data,0);//否则新的颜色
                    setTimeout(cross_border_detect(data),200);//越界检测
                }
                return true;
            }else{//如果一样，即没有数据更新，退出
                return false;
            };
        }else{//如果latest为空，则是第一次运行
            if(data['latest'])
            {
                var point = new BMap.Point(data['latest'].lng,data['latest'].lat);
                point.set_c(data['latest'].time,data['latest'].height);
                point.set_ll(data['latest'].longitude,data['latest'].latitude)
                latest = point;
                point_line_add(data,0);//有数据更新，则画点画线
                setTimeout(cross_border_detect(data),200);//越界检测
                return true;
            }else{
                return false;
            }
        }
    }

    function Point_ajax()
    {
        var time_c;
        if(latest){
            var time_c = latest.time_c;
        }
        $(function(){
            $.ajax({
                type:"GET",
                url:"/frontend/uav_job_detail/",
                data:{job_detail_id:job_detail_id,latest:time_c},
                dataType:"json",
                success: function(data)  {  
                    latest_detect(data);
                    dynamicSafePolygon(data,5);
                }
            });
        });
    }

    function get_frequence()
    {
        name = "frequence=";
        var x = document.cookie.split(';');
        for (var i = 0; i < x.length; i++)
        {
            var c = x[i].trim();
            if (c.indexOf(name)==0) 
                return c.substring(name.length,c.length);
        }
        return "";
    }
    function set_frequence(value)
    {
        document.cookie = "frequence="+value;
    }
    function check_frequence()
    {
        var f = get_frequence();
        if (f!=""){
            frequence = f;
        }else{
            frequence = 4000;
        }
        console.log("当前刷新频率"+frequence/1000+"秒")
        if(frequence_Interval){
            clearInterval(frequence_Interval);
        }
        set_frequence(frequence);
        window.frequence_Interval = setInterval('Point_ajax()',frequence);
    }
    function f_speedUp()
    {
        var f = get_frequence();
        if(f == "")
            f = 4000;
        else
            f = f * 2;
        set_frequence(f);
        check_frequence();
    }
    function f_speedDown()
    {
        var f = get_frequence()/2;
        if(f < 1000){
            f = 1000;
        }
        set_frequence(f);
        check_frequence();
    }
    window.onload = initMap;//创建和初始化地图
    window.frequence_Interval = setInterval('Point_ajax()',frequence);
    window.setInterval('line_setStrokeOpacity()',freq)