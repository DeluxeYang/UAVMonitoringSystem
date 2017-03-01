var shapeMargin = 10;//蓝色原线的距离
var shapePadding = 10;//绿色缩小原线的距离
var polygon;
var marginPolygon;
var paddingPolygon;

var dragVertexIndex = null;
var hoverLocation = null;
var polygonVertexRadius = 9;

function getCanvas() { return document.getElementById("demo-canvas"); }

function drawPolygonVertexLabels(g, p)
{
    for (var i = 0; i < p.vertices.length; i++) {
        var vertex = p.vertices[i];
        if (vertex.hidden)
            continue;
        g.fillText(vertex.label, vertex.x - 3, vertex.y + 4);
    }
}

function drawPolygonVertices(g, p, r)
{
    g.strokeStyle = "none";

    for (var i = 0; i < p.vertices.length; i++) {
        var vertex = p.vertices[i];
        if (vertex.hidden)
            return;
        g.beginPath();
        g.arc(vertex.x, vertex.y, r, 0, Math.PI*2, false)
        g.fill();

        /*
        if (vertex.isReflex) {
            g.strokeStyle = "rgb(238,236,230)";
            g.lineWidth = 1;
            g.arc(vertex.x, vertex.y, polygonVertexRadius+2, 0, Math.PI*2, false);
            g.stroke();
        }
        */

        g.closePath();
    }
}

function drawPolygonEdges(g, p)
{
    if (p.vertices.length == 0)
        return;

    g.beginPath();

    for (var i = 0; i < p.vertices.length; i++) {
        var vertex = p.vertices[i];
        if (i == 0) 
            g.moveTo(vertex.x, vertex.y);
        else
            g.lineTo(vertex.x, vertex.y);
    }
    if (polygon.closed)
        g.lineTo(p.vertices[0].x, p.vertices[0].y);

    g.stroke();
    g.closePath();
}

function drawPolygonOffsetEdges(g, p)
{
    var edges = p.offsetEdges;
    if (!edges || edges.length == 0)
        return;

    g.beginPath();
    for (var i = 0; i < edges.length; i++) {
        var edge = edges[i];
        g.moveTo(edge.vertex1.x, edge.vertex1.y);
        g.lineTo(edge.vertex2.x, edge.vertex2.y);
    }
    g.stroke();
    g.closePath();

}

function draw() {
    var canvas = getCanvas();
    var g = canvas.getContext("2d");

    g.clearRect(0, 0, canvas.width, canvas.height);

    // marginPolygon
    g.fillStyle = "none";
    g.strokeStyle = "rgba(238,236,230,0.5)";
    g.lineWidth = "1";
    drawPolygonOffsetEdges(g, marginPolygon);

    g.strokeStyle = "rgb(79,129,189)";
    g.lineWidth = "2";
    g.fillStyle = "none";
    drawPolygonEdges(g, marginPolygon);

    g.fillStyle = "rgb(79,129,189)";
    drawPolygonVertices(g, marginPolygon, polygonVertexRadius - 4);

    // paddingPolygon
  
    g.strokeStyle = "rgba(238,236,230,0.5)"
    g.lineWidth = "1";
    drawPolygonOffsetEdges(g, paddingPolygon);

    g.strokeStyle = "rgb(119,146,60)";
    g.lineWidth = "2";
    g.fillStyle = "none";
    drawPolygonEdges(g, paddingPolygon);

    g.fillStyle = "rgb(119,146,60)";
    drawPolygonVertices(g, paddingPolygon, polygonVertexRadius - 4);

    // polygon

    g.strokeStyle = "rgb(238,236,230)";
    g.fillStyle = "none";
    g.lineWidth = "1";
    drawPolygonEdges(g, polygon);

    g.fillStyle = "rgb(255,161,0)";
    drawPolygonVertices(g, polygon, polygonVertexRadius);

    g.font = "12px Arial";
    g.fillStyle = "black";
    drawPolygonVertexLabels(g, polygon);
}

// See http://paulbourke.net/geometry/pointlineplane/

function distanceToEdgeSquared(p1, p2, p3)
{
    var dx = p2.x - p1.x;
    var dy = p2.y - p1.y;
    
    if (dx == 0 || dy == 0) 
        return Number.POSITIVE_INFNITY;

    var u = ((p3.x - p1.x) * dx + (p3.y - p1.y) * dy) / (dx * dx + dy * dy);

    if (u < 0 || u > 1)
        return Number.POSITIVE_INFINITY;

    var x = p1.x + u * dx;  // closest point on edge p1,p2 to p3
    var y = p1.y + u * dy;

    return Math.pow(p3.x - x, 2) + Math.pow(p3.y - y, 2);

}

function polygonVertexNear(p)
{
    var thresholdDistanceSquared = polygonVertexRadius * polygonVertexRadius * 2;
    for (var i = 0; i < polygon.vertices.length; i++) {
        var vertex = polygon.vertices[i];
        var dx = vertex.x - p.x;
        var dy = vertex.y - p.y;
        if (dx*dx + dy*dy < thresholdDistanceSquared)
            return i;
    }
    return null;
}

function polygonEdgeNear(p)
{
    var thresholdDistanceSquared = polygonVertexRadius * polygonVertexRadius * 2;
    for (var i = 0; i < polygon.vertices.length; i++) {
        var v0 = polygon.vertices[i];
        var v1 = polygon.vertices[(i + 1) % polygon.vertices.length];
        if (distanceToEdgeSquared(v0, v1, p) < thresholdDistanceSquared)
            return {index0: i, index1: (i + 1) % polygon.vertices.length};
    }
    return null;
}

// See http://hansmuller-webkit.blogspot.com/2013/02/where-is-mouse.html
function canvasEventLocation(event)
{
    var canvas = getCanvas();
    var style = document.defaultView.getComputedStyle(canvas, null);

    function styleValue(property) {
        return parseInt(style.getPropertyValue(property), 10) || 0;
    }

    var scaleX = canvas.width / styleValue("width");
    var scaleY = canvas.height / styleValue("height");

    var canvasRect = canvas.getBoundingClientRect();
    var canvasX = scaleX * (event.clientX - canvasRect.left - canvas.clientLeft - styleValue("padding-left"));
    var canvasY = scaleY * (event.clientY - canvasRect.top - canvas.clientTop - styleValue("padding-top"))

    return {x: canvasX, y: canvasY};
}


function handleMouseDown(event)
{
    var eventXY = canvasEventLocation(event);
    getCanvas().addEventListener("mousemove", handleMouseMove, false); 

    if (polygon.closed) {
        dragVertexIndex = polygonVertexNear(eventXY);
        if (dragVertexIndex == null) {
            var edge = polygonEdgeNear(canvasEventLocation(event));
            if (edge != null) {
                polygon.vertices.splice(edge.index1, 0, eventXY);
                computeAll();
            }
        }
    }
    else
    {
        polygon.closed = polygonVertexNear(eventXY) != null;
        if (!polygon.closed)
            polygon.vertices.push(eventXY);
        else 
            computeAll();
    }

    // The following appears to be the only way to prevent Chrome from showing the text select cursor.
    // For the record: hacks based on -webkit-user-select: none, or #canvas:focus,#canvas:active do not 
    // currently work.

    event.preventDefault();
    event.stopPropagation();

    draw();
}

function handleMouseMove(event)
{
    if (dragVertexIndex != null) {
        var eventXY = canvasEventLocation(event);
        polygon.vertices[dragVertexIndex].x = eventXY.x;
        polygon.vertices[dragVertexIndex].y = eventXY.y;
        computeAll();
        draw();
    }
}

function handleMouseUp(event)
{
    getCanvas().removeEventListener("mousemove", handleMouseMove);
    dragVertexIndex = null;
    draw();
}

function handleSliderChange()
{
    function $(id) { return document.getElementById(id); }

    shapeMargin = parseInt($("slider.shapeMargin").value);
    $("value.shapeMargin").innerHTML = shapeMargin;
    
    shapePadding = parseInt($("slider.shapePadding").value);
    $("value.shapePadding").innerHTML = shapePadding;
    
    computeAll();
    draw();
}

function inwardEdgeNormal(edge)
{
    // Assuming that polygon vertices are in clockwise order
    var dx = edge.vertex2.x - edge.vertex1.x;
    var dy = edge.vertex2.y - edge.vertex1.y;
    var edgeLength = Math.sqrt(dx*dx + dy*dy);
    return {x: -dy/edgeLength, y: dx/edgeLength};
}

function outwardEdgeNormal(edge)
{
    var n = inwardEdgeNormal(edge);
    return {x: -n.x, y: -n.y};
}

// If the slope of line vertex1,vertex2 greater than the slope of vertex1,p then p is on the left side of vertex1,vertex2 and the return value is > 0.
// If p is colinear with vertex1,vertex2 then return 0, otherwise return a value < 0.

function leftSide(vertex1, vertex2, p)
{
    return ((p.x - vertex1.x) * (vertex2.y - vertex1.y)) - ((vertex2.x - vertex1.x) * (p.y - vertex1.y));
}

function isReflexVertex(polygon, vertexIndex)
{
    // Assuming that polygon vertices are in clockwise order
    var thisVertex = polygon.vertices[vertexIndex];
    var nextVertex = polygon.vertices[(vertexIndex + 1) % polygon.vertices.length];
    var prevVertex = polygon.vertices[(vertexIndex + polygon.vertices.length - 1) % polygon.vertices.length];
    if (leftSide(prevVertex, nextVertex, thisVertex) < 0)
        return true;  // TBD: return true if thisVertex is inside polygon when thisVertex isn't included

    return false;
}

function createPolygon(vertices)
{
    var polygon = {vertices: vertices};

    var edges = [];
    var minX = (vertices.length > 0) ? vertices[0].x : undefined;
    var minY = (vertices.length > 0) ? vertices[0].y : undefined;
    var maxX = minX;
    var maxY = minY;

    for (var i = 0; i < polygon.vertices.length; i++) {
        vertices[i].label = String(i);
        vertices[i].isReflex = isReflexVertex(polygon, i);
        var edge = {
            vertex1: vertices[i], 
            vertex2: vertices[(i + 1) % vertices.length], 
            polygon: polygon, 
            index: i
        };
        edge.outwardNormal = outwardEdgeNormal(edge);
        edge.inwardNormal = inwardEdgeNormal(edge);
        edges.push(edge);
        var x = vertices[i].x;
        var y = vertices[i].y;
        minX = Math.min(x, minX);
        minY = Math.min(y, minY);
        maxX = Math.max(x, maxX);
        maxY = Math.max(y, maxY);
    }                       
    
    polygon.edges = edges;
    polygon.minX = minX;
    polygon.minY = minY;
    polygon.maxX = maxX;
    polygon.maxY = maxY;
    polygon.closed = true;

    return polygon;
}

// based on http://local.wasp.uwa.edu.au/~pbourke/geometry/lineline2d/, edgeA => "line a", edgeB => "line b"

function edgesIntersection(edgeA, edgeB)
{
    var den = (edgeB.vertex2.y - edgeB.vertex1.y) * (edgeA.vertex2.x - edgeA.vertex1.x) - (edgeB.vertex2.x - edgeB.vertex1.x) * (edgeA.vertex2.y - edgeA.vertex1.y);
    if (den == 0)
        return null;  // lines are parallel or conincident

    var ua = ((edgeB.vertex2.x - edgeB.vertex1.x) * (edgeA.vertex1.y - edgeB.vertex1.y) - (edgeB.vertex2.y - edgeB.vertex1.y) * (edgeA.vertex1.x - edgeB.vertex1.x)) / den;
    var ub = ((edgeA.vertex2.x - edgeA.vertex1.x) * (edgeA.vertex1.y - edgeB.vertex1.y) - (edgeA.vertex2.y - edgeA.vertex1.y) * (edgeA.vertex1.x - edgeB.vertex1.x)) / den;

    if (ua < 0 || ub < 0 || ua > 1 || ub > 1)
        return null;

    return {x: edgeA.vertex1.x + ua * (edgeA.vertex2.x - edgeA.vertex1.x),  y: edgeA.vertex1.y + ua * (edgeA.vertex2.y - edgeA.vertex1.y)};
}

function appendArc(vertices, center, radius, startVertex, endVertex, isPaddingBoundary)
{
    const twoPI = Math.PI * 2;
    var startAngle = Math.atan2(startVertex.y - center.y, startVertex.x - center.x);
    var endAngle = Math.atan2(endVertex.y - center.y, endVertex.x - center.x);
    if (startAngle < 0)
        startAngle += twoPI;
    if (endAngle < 0)
        endAngle += twoPI;
    var arcSegmentCount = 5; // An odd number so that one arc vertex will be eactly arcRadius from center.
    var angle = ((startAngle > endAngle) ? (startAngle - endAngle) : (startAngle + twoPI - endAngle));
    var angle5 =  ((isPaddingBoundary) ? -angle : twoPI - angle) / arcSegmentCount;

    vertices.push(startVertex);
    for (var i = 1; i < arcSegmentCount; ++i) {
        var angle = startAngle + angle5 * i;
        var vertex = {
            x: center.x + Math.cos(angle) * radius,
            y: center.y + Math.sin(angle) * radius,
        };
        vertices.push(vertex);
    }
    vertices.push(endVertex);
}

function createOffsetEdge(edge, dx, dy)
{
    return {
        vertex1: {x: edge.vertex1.x + dx, y: edge.vertex1.y + dy},
        vertex2: {x: edge.vertex2.x + dx, y: edge.vertex2.y + dy}
    };
}

function createMarginPolygon(polygon)
{
    var offsetEdges = [];
    for (var i = 0; i < polygon.edges.length; i++) {
        var edge = polygon.edges[i];
        var dx = edge.outwardNormal.x * shapeMargin;
        var dy = edge.outwardNormal.y * shapeMargin;
        offsetEdges.push(createOffsetEdge(edge, dx, dy));
    }

    var vertices = [];
    for (var i = 0; i < offsetEdges.length; i++) {
        var thisEdge = offsetEdges[i];
        var prevEdge = offsetEdges[(i + offsetEdges.length - 1) % offsetEdges.length];
        var vertex = edgesIntersection(prevEdge, thisEdge);
        if (vertex)
            vertices.push(vertex);
        else {
            var arcCenter = polygon.edges[i].vertex1;
            appendArc(vertices, arcCenter, shapeMargin, prevEdge.vertex2, thisEdge.vertex1, false);
        }
    }

    var marginPolygon = createPolygon(vertices);
    marginPolygon.offsetEdges = offsetEdges;
    return marginPolygon;
}

function createPaddingPolygon(polygon)
{
    var offsetEdges = [];
    for (var i = 0; i < polygon.edges.length; i++) {
        var edge = polygon.edges[i];
        var dx = edge.inwardNormal.x * shapePadding;
        var dy = edge.inwardNormal.y * shapePadding;
        offsetEdges.push(createOffsetEdge(edge, dx, dy));
    }

    var vertices = [];
    for (var i = 0; i < offsetEdges.length; i++) {
        var thisEdge = offsetEdges[i];
        var prevEdge = offsetEdges[(i + offsetEdges.length - 1) % offsetEdges.length];
        var vertex = edgesIntersection(prevEdge, thisEdge);
        if (vertex)
            vertices.push(vertex);
        else {
            var arcCenter = polygon.edges[i].vertex1;
            appendArc(vertices, arcCenter, shapePadding, prevEdge.vertex2, thisEdge.vertex1, true);
        }
    }

    var paddingPolygon = createPolygon(vertices);
    paddingPolygon.offsetEdges = offsetEdges;
    return paddingPolygon;
}

function computeAll()
{
    polygon = createPolygon(polygon.vertices);
    marginPolygon = createMarginPolygon(polygon);
    paddingPolygon = createPaddingPolygon(polygon);
}

function init() 
{
    var polygonVertices =  [{x: 143, y: 327}, {x: 80, y: 236}, {x: 151, y: 148}, {x: 454, y: 69}, {x: 560, y: 320}];
    polygon = createPolygon(polygonVertices);

    var canvas = getCanvas();
    canvas.addEventListener("mousedown", handleMouseDown, false);
    canvas.addEventListener("mouseup", handleMouseUp, false);

    var sliderNames = ["slider.shapeMargin", "slider.shapePadding"];
    for (var i = 0; i < sliderNames.length; i++) {
        var slider = document.getElementById(sliderNames[i]);
        slider.onchange = handleSliderChange;
    } 

    computeAll();
    draw();
}

init();