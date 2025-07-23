var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);

if (global.battle_state == BS_ATTACK) {
    if (global.soul_mode == SOUL_RED) {
        hspeed = (key_right - key_left) * 4;
        vspeed = (key_down - key_up) * 4;   
    }
} else {
    hspeed = 0;
    vspeed = 0;
}

if (global.battle_state == BS_FLEEING) {
    hspeed = -2;
    sprite_index = spr_soul_flee;
    image_speed = 1;
}