damage_ui_y += (damage_ui_yto - damage_ui_y) / 3;

if (instance_exists(obj_dmgwriter)) {
    global.has_been_damaged_ow = true;
    if (global.damage_timer < 30) {
        global.damage_timer = 30;
    }
}

if (global.has_been_damaged_ow) {
    global.damage_timer -= 1;
    damage_ui_yto = 205;
    
    if (global.damage_timer == 0) {
        global.has_been_damaged_ow = false;
        damage_ui_yto = 280;
    }
}