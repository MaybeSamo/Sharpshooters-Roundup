if (con == 0) {
    cutscene = scr_setup_cutscene();
    c_add_actor(obj_actor_tenna, 223, 184, -99999, "ten");
    c_add_actor(obj_actor, -10, 135, 0, "kr");
    c_sel_actor("kr");
    c_sprite_index(spr_krisr_dark);
    c_add_actor(obj_actor, -10, 165, -1, "su");
    c_sel_actor("su");
    c_sprite_index(spr_susie_right);
    c_add_actor(obj_actor, -10, 185, -2, "ral");
    c_sel_actor("ral");
    c_sprite_index(spr_ralsei_walk_right);
    con = 1;
}

if (con == 1) {
    c_sel_actor("ten");
    c_shake_magnitude_x(0.3);
    c_var_inst_set(obj_actor_tenna, "shake_duration", 100000);
    c_shake(true);
    c_sel_actor("kr");
    c_move_towards_point(60, 135, 1);
    c_image_speed(1);
    c_sel_actor("su");
    c_move_towards_point(60, 165, 1);
    c_image_speed(1);
    c_sel_actor("ral");
    c_move_towards_point(60, 185, 1);
    c_image_speed(1);
    c_wait(60);
    c_sel_actor("kr");
    c_image_speed(0);
    c_image_index(0);
    c_sel_actor("su");
    c_image_speed(0);
    c_image_index(0);
    c_sel_actor("ral");
    c_image_speed(0);
    c_image_index(0);
    c_set_global("box_pos", "top");
    c_msgpush("* Finally.^1\n* Took long enough to get\n  in here.");
    c_msgpush("* Odd...^1\n* All that's inside is...");
    c_msgpush("* Tenna...?");
    c_wait_talk();
    c_shake(false);
    c_wait(15);
    c_var_inst_set(obj_actor_tenna, "shake_timer", 0);
    c_play_sound(snd_grap);
    c_sel_actor("ten");
    c_image_index(1);
    c_shake_magnitude_x(2);
    c_shake(true);
    c_var_inst_set(obj_actor_tenna, "shake_duration", 15);
    c_var_inst_set(obj_actor_tenna, "black_fade_out", true);
    c_wait(10);
    c_set_global("box_pos", "bottom");
    c_msgpush("* YOU MUST LEAVE.");
    c_var_inst_set(obj_writer, "tenna_speak", true);
    c_wait_talk();
    c_set_global("box_pos", "top");
    c_msgpush("* Hell no.^1\n* Took long enough to get\n  in here.");
    c_msgpush("* At least give us an item\n  or something.");
    c_msgpush("* (Susie!)^1\n* (Don't say thing's like\n  that!)");
    c_wait_talk();
    c_sel_actor("ten");
    c_image_scale(1.25, 0.8);
    c_image_index(2);
    c_set_global("box_pos", "bottom");
    c_msgpush("* NO.^1\n* IT IS TOO LATE.");
    c_var_inst_set(obj_writer, "tenna_speak", true);
    c_wait_talk();
    c_image_scale(1.25, 0.8);
    c_image_index(3);
    c_msgpush("* IT FEEDS ON ATTENTION.^1\n* AND IT HAS BEEN STARVING.");
    c_var_inst_set(obj_writer, "tenna_speak", true);
    c_wait_talk();
    c_image_scale(1.25, 0.8);
    c_image_index(5);
    c_msgpush("* FOR A LONG.^1\n* LONG.^1\n* TIME");
    c_var_inst_set(obj_writer, "tenna_speak", true);
    con = 2;
}

if (con == 2) {
    if i_ex(obj_writer) {
        if (obj_writer.text[obj_writer.page] == "* FOR A LONG.^1\n* LONG.^1\n* TIME") {
            obj_writer.text_speed = 1;
            obj_writer.can_accept = false;
            obj_writer.can_skip = false;
            if (obj_writer.draw_char == 15 or obj_writer.draw_char == 0 or obj_writer.draw_char == 26) {
                obj_actor_tenna.shaking = true;
                obj_actor_tenna.shake_timer = 10;
                obj_actor_tenna.shake_magnitude_x = 3;
                play_sound(snd_damage);
            }
            if (obj_writer.draw_char == 15) {
                obj_actor_tenna.image_index = 6;
            }
            if (obj_writer.draw_char == 27) {
                obj_pink_gradient_bg.flash_alpha = 1;
                obj_pink_gradient_bg.flash = true;
                obj_actor_tenna.x_to = 280;
                play_sound(snd_grap);
                obj_actor_tenna.image_index = 5;
                instance_destroy(obj_writer);
                global.msg = [];
                audio_stop_sound(mus);
                con = 3;
            }
        }
    }
}

if (con == 3) {
    mus = audio_play_sound(mus_precowboy, 0, true);
    c_sel_actor("su");
    c_sprite_index(spr_susie_shock_right);
    c_wait(15);
    c_wait(8);
    c_add_inst(217, 39, -999999, obj_ss_battle_intro_bullet);
    c_wait(8);
    c_add_inst(217, 79, -999999, obj_ss_battle_intro_bullet);
    c_wait(8);
    c_add_inst(217, 119, -999999, obj_ss_battle_intro_bullet);
    c_wait(15);
    c_play_sound(snd_bigcut);
    c_var_inst_set(self, "shoot_bullets", true);
    c_wait(5);
    c_exec_func(function () {
        var _i = i_create(65, 185, obj_dmgwriter);
        _i.damage = 999;
        play_sound(snd_damage);
        with (obj_actor) {
            if (char_name == "ral") {
                use_tween = true;
                x_to = x - 30;
                sprite_index = spr_ralsie_landed;
            }
        }
    })
    c_wait(30);
    c_set_global("box_pos", "top");
    c_msgpush("* Ralsei!");
    c_msgpush("* I-^1its okay Susie...");
    c_msgpush("* I'll be back in a\nmoment.");
    c_wait_talk();
    c_wait(30);
    c_exec_func(function () {
        var _i = i_create(35, 185, obj_dmgwriter);
        play_sound(snd_hurt);
        _i.damage = 999;
        with (obj_actor) {
           if (char_name == "ral") {
                y_to = y + 50;
                sprite_index = spr_ralsei_defeat;
            }    
        }  
    });
    c_wait(20);
    c_sel_actor("su");
    c_sprite_index(spr_susie_point_right);
    c_msgpush("* Alright, asshole.^1\n* Good Luck.");
    c_wait_talk();
    c_end_cutscene();
    con = 4;
}

if (con == 4 and !i_ex(obj_cutscene)) {
    instance_destroy(obj_ss_battle_intro_bullet);
    audio_stop_sound(mus);
    mus = audio_play_sound(mus_sharpshooter, 0, true, 0.5);
    con = 5;
}

if (con == 5) {
    timer += 1;
    if (timer == 150) {
        instance_create_depth(268, 110, -999999, obj_ss_battle_intro_hand);
    }
}

if (screen_flash_con == 1) {
    screen_flash += 0.075;
    if (screen_flash >= 1) {
        alarm[0] = 10;
        screen_flash_con = 2;
    }
}

if (screen_flash_con == 3) {
    screen_flash -= 0.075;
    con = 6;
}

if (con == 6) {
    con = 8;
}


if (con == 8) {
    obj_actor_tenna.x_to = obj_actor_tenna.x + 30;
    i_create(60, 165, obj_battle_actor_susie);
    i_create(60, 135, obj_battle_actor_kris);
    i_create(245, 106, obj_sharpshooter_enemy);
    i_create(0, 0, obj_dtr_enter_battle);
    instance_destroy(obj_actor);
    instance_destroy();
    con = 9;
}
