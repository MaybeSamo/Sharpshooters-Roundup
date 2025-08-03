// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_goto_encounter(encounter){
    global.encounter = encounter;
    instance_create_depth(0, 0, -999999, obj_encounter_anim);
}