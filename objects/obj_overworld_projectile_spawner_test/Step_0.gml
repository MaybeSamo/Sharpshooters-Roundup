timer += 1;

if (timer % 15 == 0) {
    var _i = instance_create_depth(random_range(307, 575), 40, -99999999, obj_overworld_projectile);
    _i.vspeed = 5;
}