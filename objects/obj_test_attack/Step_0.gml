if (global.attack_timer == 0) {
    instance_destroy(obj_battle_bullet);
}

if (global.attack_timer == 120) {
    global.battle_state = BS_RESIZE_BOX;
    global.attack_timer = 0;
    instance_destroy(obj_battle_bullet);
    instance_destroy();
} 

if (global.attack_timer % 10 == 0) {
    var _i = i_create(obj_battle_soul.x, obj_battle_soul.y - 60, obj_battle_bullet_1);
    _i.vspeed = 5;
}