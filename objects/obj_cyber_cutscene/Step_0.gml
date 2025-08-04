if (obj_mainchara.x >= x and con == 0) {
    con = 1;
}

if (con == 1) {
    scr_setup_cutscene();
    scr_mainchara_actors();
    c_add_actor(obj_actor, 640, 150, -9999, "cap");
    c_add_actor(obj_actor, 440, 160, -9999, "no");
    c_add_actor(obj_actor, 350, 190, 150, "queen");
    con = 2;
}

if (con == 2) {
    c_set_global("box_pos", "top");
    c_msgpush("#EN1* Somebody help me...");
    c_wait_talk();
    c_sel_actor("no");
    c_sprite_index(spr_noelle_kneel);
    c_cam_following(false);
    c_cam_speed(3, 0);
    c_wait(23);
    c_cam_speed(0, 0);
    c_msgpush("#EN1* Somebody,^1 please...");
    c_wait_talk();
    c_sprite_index(spr_noelle_kneel_shocked);
    c_wait(5);
    c_msgpush("#EN2* Kris!?");
    c_wait_talk();
    c_image_index(1);
    c_msgpush("#EN1* Cool that you're\n  here,^1 just...");
    c_wait_talk();
    c_image_index(0);
    c_msgpush("#EN2* Wait,^1 get out of\n  here before it's\n  too late!");
    c_wait_talk();
    c_sel_actor("cap");
    c_sprite_index(spr_capsule);
    c_image_speed(0);
    c_dir("l");
    c_walk_speed(10);
    c_walk(true);
    c_wait(18);
    c_walk(false);
    c_image_speed(1);
    c_sel_actor("no");
    c_sprite_index(spr_noelle_shocked_dw);
    c_wait(6);
    c_sel_actor("cap");
    c_image_speed(0);
    c_image_index(5);
    c_dir("u");
    c_walk_speed(15);
    c_walk(true);
    c_sel_actor("no");
    c_dir("u");
    c_walk_speed(25);
    c_walk(true);
    c_wait(20);
    c_sel_actor("mc");
    c_move_towards_point(345, 128, 4);
    c_image_speed(2);
    c_wait(15);
    c_image_speed(0);
    c_image_index(0);
    c_sprite_index(spr_krisu_dark);
    c_set_speed(0, 0);
    c_sel_actor("queen");
    c_sprite_index(spr_queen_chair_ohoho);
    c_image_speed(1);
    c_play_sound(mus_queen_oohoo);
    c_set_speed(0, -1);
    c_wait(130);
    c_set_speed(0, 0);
    c_wait(80);
    c_set_global("box_pos", "bottom");
    c_sprite_index(spr_queen_chair_swish_wine);
    c_msgpush("* You can go now I'm too bored\n  to do anythin.");
    c_wait_talk();
    c_set_speed(0, 3);
    c_sprite_index(spr_queen_chair_ohoho);
    c_wait(30);
    c_set_speed(0, -6);
    c_wait(15);
    c_set_speed(0, 0);
    c_msgpush("* HoHoHoHo I Lied!");
    c_wait_talk();
    c_exec_func(function () {
        scr_goto_encounter(obj_encounter_asgore);
    })
    con = 3;
}

if (con == 3 and i_ex(obj_encounter_anim)) {
    con = 4;
}

if (con == 4 and !i_ex(obj_encounter_anim)) {
    c_set_global("camera_following", "true");
    c_sprite_index(spr_queen_chair_swish_wine);
    c_msgpush("* Oh Damn You Actually Won Lmao.");
    c_msgpush("* Welp I Guess You Can Go Now.");
    c_wait_talk();
    c_set_speed(0, 3);
    c_sprite_index(spr_queen_chair_ohoho);
    c_wait(60);
    c_destroy_actors();
    c_end_cutscene();
    con = 5;
}

if (con == 5 and !i_ex(obj_cutscene)) {
    global.camera_following = true;
    instance_destroy();
    global.can_move = true;
    obj_mainchara.visible = true;
}