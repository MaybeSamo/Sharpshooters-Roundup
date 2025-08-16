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
        if (array_length(global.party_member_actions) == 2) {
            global.battle_state = BattleState.DoActions;
            array_sort(global.party_member_actions, function(a, b) {
                return b.priority - a.priority;
            });
        }
        fadecon = 2;
        if (i_ex(obj_dtr_battle_box)) {
            obj_dtr_battle_box.growcon = 3;
        }
        soul.visible = false;
        obj_writer.text = ["* The Sharp Shooter breaks through!"];
        if (key_accept) {
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
                    global.party_battle_actors[party_member_selected].sprite_index = global.party_battle_actors[party_member_selected].sprites.defend;
                    global.party_battle_actors[party_member_selected].loop_animation = false;
                    array_push(global.party_member_actions, {
                        actor: party_member_selected,
                        action: global.battle_ui[party_member_selected].ui_selection,
                        priority: get_action_priority(global.battle_ui[party_member_selected].ui_selection)
                    });
                    if (party_member_selected < array_length(global.party_battle_actors) - 1) {
                        party_member_selected += 1;
                    } else {
                        current_action = 0;
                        global.battle_state = BattleState.DoActions;
                    }
                    global.battle_ui[party_member_selected].ui_selection = 0;
                    break;
            }
        }
        if (key_return and party_member_selected != 0) {
            party_member_selected -= 1;
            global.battle_ui[party_member_selected].ui_selection = 0;
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
            array_push(global.party_member_actions, { 
                actor: party_member_selected, 
                action: global.battle_ui[party_member_selected].ui_selection, 
                priority: get_action_priority(global.battle_ui[party_member_selected].ui_selection)
            });
            if (party_member_selected < array_length(global.party_battle_actors) - 1) {
                party_member_selected += 1;
            } else {
                current_action = 0;
                global.battle_state = BattleState.DoActions;
            }
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
    case BattleState.DoActions:
        for (var i = 0; i < array_length(global.battle_ui); i++) {
            global.battle_ui[i].selecting_ui = false;
        }
        writer.text = [""];
        var all_defend = array_all(global.party_member_actions, function(e) { return e.action == 4; });
        if (all_defend) {
            global.battle_state = BattleState.Attack;
        }
        switch (global.party_member_actions[current_action].action) {
            case 0:
                if (!i_ex(obj_dtr_fight_timing_ui)) {
                    if (current_action == 0) {
                        var i = instance_create_depth(74, 191, -9999999, obj_dtr_fight_timing_ui);
                        i.target_actor = obj_battle_actor_kris;
                        i.icon_spr = spr_kris_head;
                        current_action += 1;
                    }
                    if (current_action == 1) {
                        var i = instance_create_depth(74, 210, -9999999, obj_dtr_fight_timing_ui);
                        i.target_actor = obj_battle_actor_susie;
                        i.icon_spr = spr_susie_head;
                    }
                }
                break;
        }
        break;
}

if (global.debug) {
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")) and !i_ex(obj_debug_attack_menu)) {
        i_create(0, 0, obj_debug_attack_menu);
    }
}

show_debug_message(global.party_member_actions);
show_debug_message(global.battle_state);