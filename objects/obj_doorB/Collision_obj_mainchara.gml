if (!instance_exists(obj_fade_transition)) {
    scr_room_goto_fade(target_room, 0.1);
    var _i = instance_create_depth(0, 0, 0, obj_room_trans);
    _i.type = "b";
    _i.target_rm = target_room;
}
global.can_move = false;