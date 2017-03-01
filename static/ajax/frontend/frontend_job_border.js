
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addPolygon(job_border_json);
    }
    var options = {//飞行记录点样式
        size: BMAP_POINT_SIZE_BIG,
        shape: BMAP_POINT_SHAPE_CIRCLE,
        color: 'rgba(255,0,0,0)'
        }

    function addPolygon(PPoint)
    {//已分 section
        var points = {};
        var points_all = [];
        for(var j=0;j<PPoint.length;j++)
        {
            var p1 = PPoint[j].fields.lng;
            var p2 = PPoint[j].fields.lat;
            if( points[PPoint[j].fields.section] == null)
                points[PPoint[j].fields.section] = [];
            points[PPoint[j].fields.section].push(new BMap.Point(p1,p2));
            points_all.push(new BMap.Point(p1,p2));
        }

        for (var i = 1; i < PPoint.length; i++) {
            if(points[i] == null)
                break;
            var polygon = new BMap.Polygon(points[i]);
            map.addOverlay(polygon);
        }

        var border_point = new BMap.PointCollection(points_all, options);
        map.addOverlay(border_point);
        border_point.addEventListener('mouseover', function (e)
        {
            map.openInfoWindow(new BMap.InfoWindow('边界点'+'<br>经度：' + e.point.lng + '<br>纬度：' + e.point.lat, {width : 50,height: 50,}),
                new BMap.Point(e.point.lng,e.point.lat));
        });

        var viewport = map.getViewport(points_all);
        map.centerAndZoom(viewport.center,viewport.zoom-1);//设定地图的中心点和坐标并将地图显示在地图容器中
    }

    window.onload = initMap;//创建和初始化地图