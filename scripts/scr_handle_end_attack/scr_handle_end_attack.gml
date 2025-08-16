// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_handle_end_attack(){
    global.party_member_actions = [];
    instance_destroy(obj_dtr_battle_bullet);
    global.battle_state = BattleState.SelectAction;
    global.attack_timer = 0;
    obj_dtr_battle_controller.party_member_selected = 0;
    instance_destroy();
}