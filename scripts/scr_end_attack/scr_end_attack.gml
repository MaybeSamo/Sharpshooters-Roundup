function scr_end_attack(){
    global.battle_state = BS_RESIZE_BOX;
    global.attack_timer = 0;
    instance_destroy(obj_battle_bullet);
    instance_destroy();
}