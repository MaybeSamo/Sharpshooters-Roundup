var key_accept = keyboard_check_pressed(ord("Z"));

if (side == 0) {
    if (x >= 608) {
        instance_destroy();
        with (obj_fight_timing) {
            exiting = true;
        }
    }
} else if (side == 1) {
    if (x <= 32) {
        instance_destroy();
        with (obj_fight_timing) {
            exiting = true;
        }
    }
}

if (key_accept and !slashed) {
    slashed = true;
    hspeed = 0;
    play_sound(snd_laz);
    image_speed = 1;
    alarm[0] = 60;
    show_debug_message(global.encounter_bodies[global.btl_vertical_selection].x);
    instance_create_depth(global.encounter_bodies[global.btl_vertical_selection].x + 60, global.encounter_bodies[global.btl_vertical_selection].y + 40, -99999, obj_battle_slice);
}