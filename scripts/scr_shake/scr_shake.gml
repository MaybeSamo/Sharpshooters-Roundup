// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_shake(_strength, _duration){
    obj_camera_controller.shake_magnitude = _strength;
    obj_camera_controller.shake_duration = _duration;
    obj_camera_controller.shake_timer = _duration;
}