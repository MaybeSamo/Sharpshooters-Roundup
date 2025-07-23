#macro BS_SELECT_BUTTON 0
#macro BS_SELECT_MONSTER 1
#macro BS_ACT_SELECT 2
#macro BS_DIALOGUE 3
#macro BS_ATTACK 4
#macro BS_ACT_BOX_DIALOGUE 5
#macro BS_MERCY_SELECT 6
#macro BS_FLEEING 7
#macro BS_SELECT_ITEM 8
#macro BS_FIGHT_TIMING 9
#macro BS_RESIZE_BOX 10
#macro BS_ITEM_USE 11

#macro FIGHT_BT 0
#macro ACT_BT 1
#macro ITEM_BT 2
#macro MERCY_BT 3

global.border_width = 575;
global.border_height = 130;
global.btl_selected_button = 0;
global.btl_vertical_selection = 0;
global.btl_horizontal_selection = 0;
global.battle_state = BS_SELECT_BUTTON;
global.btl_first_turn_done = false;
global.attack_timer = 0;
global.act_selected = 0;
global.selected_monster = 0;
depth = -9;

instance_create_depth(0, 0, 0, obj_battle_box);
encounter = instance_create_depth(0, 0, 0, global.encounter);

soul = instance_create_depth(100, 448, -9999, obj_battle_soul);
battle_writer = 0;

timing_instantiated = false;

//Positions for the soul
soul_button_x_positions = [42, 192, 358, 517]; 
siner = 0;

item_used = false;

fade_alpha = 1;

delayed = false;
delay = function() {
    delayed = true
	alarm[0] = 1;
}