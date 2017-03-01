
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addPolygon(job_border_json);
        addPolyline(job_desc_json);//向地图中添加线
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("mapDiv");//在百度地图容器中创建一个地图
        //var point = new BMap.Point({{job_desc.0.longitude}},{{job_desc.0.latitude}});//定义一个中心点坐标
        //map.centerAndZoom(point,12);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);

        map.addControl(new BMap.MapTypeControl());
    }
    
    function addPolygon(PPoint)
    {
        var points = [];
        console.log(PPoint.length);
        for(var j=0;j<PPoint.length;j++)
        {
            console.log(PPoint[j].fields);
            var p1 = PPoint[j].fields.lng;
            var p2 = PPoint[j].fields.lat;
            points.push(new BMap.Point(p1,p2));
        }

        var polygon = new BMap.Polygon(points);
        map.addOverlay(polygon);

        var viewport = map.getViewport(points);
        map.centerAndZoom(viewport.center,viewport.zoom-1);//设定地图的中心点和坐标并将地图显示在地图容器中
    }

    function addPolyline(PPoint){
            var points = [];
            var info = [];
            var options = {//飞行记录点样式
                size: BMAP_POINT_SIZE_BIG,
                shape: BMAP_POINT_SHAPE_CIRCLE,
                color: 'rgba(255,0,0,0.0)'
            }
            var opts = {//信息窗口样式
                width : 200,
                height: 120,
            }
            for(var j=0;j<PPoint.length;j++){
                var p1 = PPoint[j].fields.longitude;
                var p2 = PPoint[j].fields.latitude;
                var ti = PPoint[j].fields.time;
                var hi = PPoint[j].fields.height;
                points.push(new BMap.Point(p1,p2));
                info.push(p1,p2,ti,hi);
            }
            //画线
            var line = new BMap.Polyline(points,{strokeStyle:"solid",strokeWeight:4,strokeColor:"#A52A2A",strokeOpacity:1});
            map.addOverlay(line);
            //画点，透明
            var point = new BMap.PointCollection(points, options);
            map.addOverlay(point);
                
            point.addEventListener('mouseover', function (e)
            {
                console.log(e)
                /*
                var u=0;//以坐标点匹配信息
                var j=0;
                for(;j<PPoint.length;j++)
                {
                    if(info[u]==e.point.lng&&info[u+1]==e.point.lat)
                        break;
                    u=u+4;
                }
                j=j+1;
                map.openInfoWindow(new BMap.InfoWindow('飞行记录点'+ j +'<br>经度：' + e.point.lng + '<br>纬度：' + e.point.lat + '<br>时间：' + info[u+2] + '<br>海拔：' + info[u+3] + '米<br>', opts),new BMap.Point(e.point.lng,e.point.lat));
                });
                */
                console.log(job_detail_id)
                map.openInfoWindow(new BMap.InfoWindow('读取中...', opts),new BMap.Point(e.point.lng,e.point.lat));
                $(function(){
                    $.ajax({
                        type:"GET",
                        url:"/get_job_desc_ajax/",
                        data:{job_detail_id:job_detail_id,lng:e.point.lng,lat:e.point.lat},
                        dataType:"json",
                        success: function(data) {
                            map.openInfoWindow(new BMap.InfoWindow('飞行记录点'+'<br>经度：' + e.point.lng + '<br>纬度：' + e.point.lat + '<br>日期：' + data.time.slice(0,10) +'<br>时间：' + data.time.slice(11,19) + '<br>海拔：' + data.height + '米<br><br>', opts),new BMap.Point(e.point.lng,e.point.lat));
                        }
                    });
                });
            })
    }
    window.onload = initMap;//创建和初始化地图

/*$(document).ready(function(){
	$.ajax({
        type:"POST",
        url:"/add/",
        data:{name:c},
        dataType:"json",
        success: function(data) {
            $("#p").text(data.nameaa)
        }
    });
});*/