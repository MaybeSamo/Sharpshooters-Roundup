if (obj_mainchara.x >= x and con == 0) {
    con = 1;
}

if (con == 1) {
    var _cut = instance_create_depth(0, 0, 0, obj_cutscene);
    _cut.event_queue = [
    c_add_actor(obj_actor, 605, 95, -9999, "knight"),
    c_sel_actor("knight"),
    c_var_inst_set(obj_actor, "use_sillouhete", true),
    c_set_siner_values(0, 0, 1, 0.1),
    c_play_sound(mus_knight_breath),
    c_set_global("can_move", false),
    c_sprite_index(spr_roaringknight_droop),
    c_image_speed(1),
    c_wait(30),
    c_cam_following(false),
    c_cam_speed(2, 0),
    c_wait(60),
    c_cam_speed(0, 0),
    c_wait(60),
    c_msgpush("* Chat."),
    c_msgpush("* Is that the...^1\n* /RROARING KNIGHT!?!?!?!"),
    c_wait_talk(),
    c_wait(60),
    c_walk_speed(5),
    c_dir("r"),
    c_walk(true),
    c_msgpush("* @WOop"),
    c_msgpush("* Nvm their gone."),
    c_wait_talk(),
    c_cam_speed(-4, 0),
    c_wait(28.5),
    c_cam_speed(0, 0),
    c_cam_following(true),
    c_set_global("can_move", true),
    c_destroy_actors(),
    c_end_cutscene(),
    ]
    con = 2;
}