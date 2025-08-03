var dx = targetx - obj.x;
var dy = targety - obj.y;
var dist = point_distance(obj.x, obj.y, targetx, targety);

if (dist > spd) {
    var dir_x = dx / dist;
    var dir_y = dy / dist;

    obj.x += dir_x * spd;
    obj.y += dir_y * spd;
} else {
    obj.x = targetx;
    obj.y = targety;
    instance_destroy();
}