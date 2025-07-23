// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_goto_fade(_room, _fade_speed){
    instance_create_depth(0, 0, 0, obj_fade_transition);
    if (instance_exists(obj_fade_transition)) {
        with (obj_fade_transition) {
            fade_state = "fade_out";
            target_room = _room;
            fade_speed = _fade_speed;
        }
    }
}