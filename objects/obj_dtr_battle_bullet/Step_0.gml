var radius = 32;
var soul = instance_nearest(x, y, obj_dtr_battle_soul);

if (soul != noone) {
    if (point_distance(x, y, soul.x, soul.y) <= radius and !grazed) {
        var graze = instance_create_depth(soul.x, soul.y, soul.depth, obj_graze);
        graze.image_xscale = 0.5;
        graze.image_yscale = 0.5;
        grazed = true;
    }
}