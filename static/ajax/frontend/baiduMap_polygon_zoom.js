var shapeMargin = 50;//蓝色原线的距离
var shapePadding = 50;//绿色缩小原线的距离
var polygon;
var marginPolygon;
var paddingPolygon;

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

function createOffsetEdge(edge, dx, dy)
{
    return {
        vertex1: {x: edge.vertex1.x + dx, y: edge.vertex1.y + dy},
        vertex2: {x: edge.vertex2.x + dx, y: edge.vertex2.y + dy}
    };
}

function edgesIntersection(edgeA, edgeB)
{
    var den = (edgeB.vertex2.y - edgeB.vertex1.y) * (edgeA.vertex2.x - edgeA.vertex1.x) - (edgeB.vertex2.x - edgeB.vertex1.x) * (edgeA.vertex2.y - edgeA.vertex1.y);
    if (den == 0)
        return null;  // lines are parallel or conincident

    var ua = ((edgeB.vertex2.x - edgeB.vertex1.x) * (edgeA.vertex1.y - edgeB.vertex1.y) - (edgeB.vertex2.y - edgeB.vertex1.y) * (edgeA.vertex1.x - edgeB.vertex1.x)) / den;
    var ub = ((edgeA.vertex2.x - edgeA.vertex1.x) * (edgeA.vertex1.y - edgeB.vertex1.y) - (edgeA.vertex2.y - edgeA.vertex1.y) * (edgeA.vertex1.x - edgeB.vertex1.x)) / den;

    /*if (ua < 0 || ub < 0 || ua > 1 || ub > 1)
        return null;*/

    return {x: edgeA.vertex1.x + ua * (edgeA.vertex2.x - edgeA.vertex1.x),  y: edgeA.vertex1.y + ua * (edgeA.vertex2.y - edgeA.vertex1.y)};
}

function createPolygon(vertices)
///var polygonVertices =  [{x: 143, y: 327}, {x: 80, y: 236}, {x: 151, y: 148}];
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

function createPaddingPolygon(polygon,sP=shapePadding)
{
    var offsetEdges = [];

    for (var i = 0; i < polygon.edges.length; i++) {

        var edge = polygon.edges[i];
        var dx = edge.inwardNormal.x * sP;
        var dy = edge.inwardNormal.y * sP;
        offsetEdges.push(createOffsetEdge(edge, dx, dy));
    }
    var vertices = [];
    for (var i = 0; i < offsetEdges.length; i++) {
        var thisEdge = offsetEdges[i];
        var prevEdge = offsetEdges[(i + offsetEdges.length - 1) % offsetEdges.length];
        var vertex = edgesIntersection(prevEdge, thisEdge);
        if (vertex)
            vertices.push(vertex);
        /*else {
            var arcCenter = polygon.edges[i].vertex1;
            appendArc(vertices, arcCenter, shapePadding, prevEdge.vertex2, thisEdge.vertex1, true);
        }*/
    }
    var paddingPolygon = createPolygon(vertices);
    paddingPolygon.offsetEdges = offsetEdges;
    return paddingPolygon;
}

function createMarginPolygon(polygon,sM=shapeMargin)
{
    var offsetEdges = [];
    for (var i = 0; i < polygon.edges.length; i++) {
        var edge = polygon.edges[i];
        var dx = edge.outwardNormal.x * sM;
        var dy = edge.outwardNormal.y * sM;
        offsetEdges.push(createOffsetEdge(edge, dx, dy));
    }

    var vertices = [];
    for (var i = 0; i < offsetEdges.length; i++) {
        var thisEdge = offsetEdges[i];
        var prevEdge = offsetEdges[(i + offsetEdges.length - 1) % offsetEdges.length];
        var vertex = edgesIntersection(prevEdge, thisEdge);
        if (vertex)
            vertices.push(vertex);
        /*else {
            var arcCenter = polygon.edges[i].vertex1;
            appendArc(vertices, arcCenter, shapeMargin, prevEdge.vertex2, thisEdge.vertex1, false);
        }*/
    }

    var marginPolygon = createPolygon(vertices);
    marginPolygon.offsetEdges = offsetEdges;
    return marginPolygon;
}