if (global.attack_timer % 30 == 0) {
    var bullet = instance_create_depth(400, obj_dtr_battle_soul.y, -99999, obj_ss_test_bullet);
    bullet.hspeed = -5;
}

if (global.attack_timer == 200) {
    instance_destroy();
    instance_destroy(obj_dtr_battle_bullet);
    global.battle_state = BattleState.SelectAction;
    global.attack_timer = 0;
}