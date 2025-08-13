var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);
var key_accept = keyboard_check_pressed(ord("Z"));
var key_return = keyboard_check_pressed(ord("X"));

for (var i = 0; i < array_length(global.battle_ui); i++) {
    global.battle_ui[i].selecting_ui = (i == party_member_selected);
}

if (global.battle_state == BattleState.SelectEnemy) {
    obj_sharpshooter_enemy.selected = true;    
} else {
    obj_sharpshooter_enemy.selected = false;
}

switch (global.battle_state) {
    case BattleState.SelectAction:
        fadecon = 2;
        if (i_ex(obj_dtr_battle_box)) {
            obj_dtr_battle_box.growcon = 3;
        }
        soul.visible = false;
        obj_writer.text = ["* The Sharp Shooter breaks through!"];
        if (key_accept and party_member_selected != array_length(global.party_battle_actors) - 1) {
            play_sound(snd_select);
            switch(global.battle_ui[party_member_selected].ui_selection) {
                case 0:
                    global.battle_state = BattleState.SelectEnemy;
                    break;
                case 1:
                    global.battle_state = BattleState.SelectEnemy;
                    break;
                case 2:
                    global.battle_state = BattleState.SelectItem;
                    break;
                case 3:
                    global.battle_state = BattleState.SelectEnemy;
                    break;
                case 4:
                    global.party_battle_actors[party_member_selected].image_index = 0;
                    array_push(global.party_member_actions, global.battle_ui[party_member_selected].ui_selection);
                    party_member_selected += 1;
            }
        }
        if (key_return and party_member_selected != 0) {
            party_member_selected -= 1;
            array_pop(global.party_member_actions);
        }
        if (key_accept and party_member_selected == array_length(global.party_battle_actors) - 1) {
        }
        break;
    case BattleState.SelectEnemy:
        soul.visible = true;
        soul.x = 20;
        soul.y = 196;
        obj_writer.draw_char = 99999;
        obj_writer.text = ["  Sharpshooter"];
        if (key_return) {
            global.battle_state = BattleState.SelectAction;
        }
        if (key_accept) {
            array_push(global.party_member_actions, global.battle_ui[party_member_selected].ui_selection);
            party_member_selected += 1;
            play_sound(snd_select);
            global.battle_state = BattleState.SelectAction;
        }
        break;
    case BattleState.Attack:
        fadecon = 1;
        global.attack_timer += 1;
        if (global.battle_con != -1) { 
            if (!i_ex(global.current_enemy[0].attacks[global.battle_con])) {
                i_create(0, 0, global.current_enemy[0].attacks[global.battle_con]);
            }   
        }
        writer.text = [""];
        for (var i = 0; i < array_length(global.battle_ui); i++) {
            global.battle_ui[i].selecting_ui = false;
        }
        if (!i_ex(obj_dtr_battle_box)) {
            soul.x = 160;
            soul.y = 109;
            soul.visible = true;
            i_create(160, 109, obj_dtr_battle_box);
        }
        break;
}

if (global.debug) {
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")) and !i_ex(obj_debug_attack_menu)) {
        i_create(0, 0, obj_debug_attack_menu);
    }
}

show_debug_message(global.party_member_actions);