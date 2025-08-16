if (global.attack_timer % 30 == 0) {
    var bullet = instance_create_depth(400, obj_dtr_battle_soul.y, -99999, obj_ss_test_bullet);
    bullet.hspeed = -5;
}

if (global.attack_timer == 200) {
    scr_handle_end_attack();
}