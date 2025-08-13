if (con == 1) {
    scr_setup_cutscene();
    scr_mainchara_actors();
    c_sel_actor("mc");
    c_wait(20);
    c_play_sound(snd_test);
    c_image_index(0);
    c_image_speed(0);
    c_sprite_index(spr_kris_kneel_stand);
    c_shake(true);
    c_shake_magnitude_x(0.2);
    c_wait(60);
    c_shake(false);
    c_play_sound(snd_test);
    c_image_speed(1);
    c_wait(20);
    c_image_speed(0);
    c_image_index(5);
    c_wait(10);
    c_destroy_actors();
    c_end_cutscene();
    con = 2;
}

if (con == 2 and !i_ex(obj_cutscene)) {
    global.can_move = true;
    obj_mainchara.visible = true;
    obj_mainchara.sprite_index = spr_krisr_dark;
    global.plot = 1;
    instance_destroy();
}