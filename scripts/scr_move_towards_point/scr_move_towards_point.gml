// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_towards_point(obj, targetx, targety, target_spd){
    var i = i_create(0, 0, obj_move_towards_point);
    i.obj = obj;
    i.spd = target_spd;
    i.targetx = targetx;
    i.targety = targety;
}