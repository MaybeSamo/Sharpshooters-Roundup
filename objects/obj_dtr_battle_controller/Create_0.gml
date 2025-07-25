#macro DBS_ENTERING_BATTLE 0
#macro DBS_INTRO_SLASH 1
#macro DBS_SELECT 2
#macro DBS_SELECT_MONSTER 3

obj_mainchara.depth = -9999999999999;
bg = instance_create_depth(0, 0, obj_mainchara.depth + 1, obj_dtr_battle_background);
enemy_obj = obj_dtr_battle_enemy;
enemy_obj.depth = obj_mainchara.depth;
enemy_obj.selected = false;
bg_alpha = 0;
timer = 0;
party_slashed_intro = false;
ui_y = 80;
ui_y_to = 80;
battle_writer = 0;
party_member_info = 0;
depth = bg.depth - 99;
snap_1 = false;
snap_2 = false;

global.battle_state = 0;
global.btl_selected_button = 0;
global.camera_following = false;
global.is_in_overworld = false;