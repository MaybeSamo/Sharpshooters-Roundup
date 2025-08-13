if (fade_alpha >= 0) {
    fade_alpha -= 0.1;
}

global.tp += (global.tp_to - global.tp) / 6;

var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);
var key_down = keyboard_check_pressed(vk_down);
var key_up = keyboard_check_pressed(vk_up);
var key_accept = keyboard_check_pressed(ord("Z"));
var key_return = keyboard_check_pressed(ord("X"));

//TP BAR\
var bar_width = clamp(global.tp, 0, 100);
var fill_width = 35 + (bar_width);
draw_set_font(fnt_main_bigger);
draw_set_color(c_white);
draw_text(30, 180, string(round(global.tp)) + "%");
draw_set_font(fnt_mars_needs_bigger)
draw_text(14, 60, "T\nP");
draw_rectangle_color(35, 180, 50, 60, c_red, c_red, c_red, c_red, false);
draw_rectangle_color(35, 180 - ((global.tp / 100) * (180 - 60)), 50, 180, c_yellow, c_yellow, c_yellow, c_yellow, false);
draw_rectangle_color(35, 180, 50, 60, c_black, c_black, c_black, c_black, true);

draw_set_font(fnt_mars_needs_bigger);
draw_set_color(c_white);
draw_text_transformed(23, 395, global.name + "    LV " + string(global.lvl), 1, 1, 0);

var bar_x = 270
var bar_y = 397;
var bar_width = 25;
var bar_height = 20;

draw_sprite(spr_hp, 0, 250, 407);

draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

var hp_ratio = global.player_health / global.max_player_health;
draw_set_color(c_yellow);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_ratio), bar_y + bar_height, false);

draw_set_color(c_white);
draw_text(bar_x + bar_width + 10, bar_y - 2, string(global.player_health) + " / " + string(global.max_player_health));

draw_sprite(spr_fight_bt, global.btl_selected_button == 0 ? 1 : 0, 82, 448);
draw_sprite(spr_act_bt, global.btl_selected_button == 1 ? 1 : 0, 231, 448);
if (array_length(global.items) != 0) {
    draw_sprite(spr_item_bt, global.btl_selected_button == 2 ? 1 : 0, 398, 448);   
} else {
    draw_sprite(spr_item_bt, 2, 398, 448);   
}
draw_sprite(spr_mercy_bt, global.btl_selected_button == 3 ? 1 : 0, 557, 448);

siner += 1;

switch (global.battle_state) {
    case BS_SELECT_BUTTON:
        item_used = false;
        if (!instance_exists(obj_writer)) {
            battle_writer = instance_create_depth(49, 265, -9999999, obj_writer);
            battle_writer.fnt = fnt_main_bigger;
            battle_writer.text = [""];
            battle_writer.can_skip = false;
            battle_writer.can_accept = false;
            battle_writer.can_skip = true;
            battle_writer.snd = snd_menu_text;
        }
        battle_writer.text = encounter.box_dialogues;
        timing_instantiated = false;
        battle_writer.visible = true;
        soul.visible = true;
        soul.x = soul_button_x_positions[global.btl_selected_button];
        soul.y = 448;
        battle_writer.x = 49;
        battle_writer.typing = true;
        battle_writer.text = encounter.box_dialogues[0];
        if (key_right) {
            global.btl_selected_button += 1;
            if (array_length(global.items) == 0 and global.btl_selected_button == 2) {
                global.btl_selected_button = 3;
            }
            play_sound(snd_squeak);
        } else if (key_left) {
            if (array_length(global.items) == 0 and global.btl_selected_button == 3) {
                global.btl_selected_button = 2;
            }
            global.btl_selected_button -= 1;
            play_sound(snd_squeak);
        }
        
        //If going past the button goes to the opposite one.
        if (global.btl_selected_button >= 4) {
            global.btl_selected_button = 0;
        } else if (global.btl_selected_button <= -1) {
            global.btl_selected_button = 3;
        }
    
        if (key_accept and !delayed) {
            global.btl_vertical_selection = 0;
            global.btl_horizontal_selection = 0;
            switch (global.btl_selected_button) {
                case FIGHT_BT: global.battle_state = BS_SELECT_MONSTER; break;
                case ACT_BT: global.battle_state = BS_SELECT_MONSTER; break;
                case ITEM_BT:
                    if (!array_length(global.items) == 0) {
                       global.battle_state = BS_SELECT_ITEM;         
                    }
                    break;
                case MERCY_BT: global.battle_state = BS_MERCY_SELECT; break;
            }
            play_sound(snd_select);
            delay();
        }
        break;
    case BS_SELECT_MONSTER:
        if (key_up) {
            global.btl_vertical_selection -= 1;
            play_sound(snd_squeak);
        } else if (key_down) {
            global.btl_vertical_selection += 1;
            play_sound(snd_squeak);
        }
        global.btl_vertical_selection = clamp(global.btl_vertical_selection, 0, array_length(global.encounter.encounter_names) - 1);
        battle_writer.visible = true;
        soul.x = 60;
        soul.y = 283 + (global.btl_vertical_selection * 33);
        battle_writer.typing = false;
        battle_writer.text = [""];
        for (var i = 0; i < array_length(global.encounter.encounter_names); i++) {
            battle_writer.text[0] += "  " + (global.encounter.mercy[i]>= 100 ? "/Y" : "") + global.encounter.encounter_names[i] + "     " + string(global.encounter.mercy[global.btl_vertical_selection]) + "/W\n";
        }
        if (key_return) {
            battle_writer.reset();
            global.battle_state = BS_SELECT_BUTTON;
        }
        if (key_accept and !delayed) {
            play_sound(snd_select);
            global.selected_monster = global.btl_vertical_selection;
            switch (global.btl_selected_button) {
                case FIGHT_BT: global.battle_state = BS_FIGHT_TIMING; break;
                case ACT_BT: global.battle_state = BS_ACT_SELECT; battle_writer.text[0] = ""; global.btl_vertical_selection = 0; global.btl_horizontal_selection = 0; break;
                case MERCY_BT: global.battle_state = BS_MERCY_SELECT; break;
            }
        }
        break;
    case BS_FIGHT_TIMING:
        battle_writer.visible = false;
        soul.visible = false;
        if (!instance_exists(obj_fight_timing) and !instance_exists(obj_battle_timing_line) and !timing_instantiated) {
            instance_create_depth(320, 320, -99999, obj_fight_timing);
            instance_create_depth(0, 0, -9999, obj_battle_timing_line);
            timing_instantiated = true;
        }
        if (timing_instantiated == true and obj_fight_timing.exiting) {
            if (array_length(global.encounter.attacks) == 0) {
                global.battle_state = BS_SELECT_BUTTON;   
            } else {
                global.battle_state = BS_ATTACK;
            }
            battle_writer.reset();
        } 
        break;
    case BS_ATTACK:
        soul.visible = true;
        if (global.attack_timer == 0) {
            soul.x = 320;
            soul.y = 320;
            if (global.encounter.attacks_randomized) {
                instance_create_depth(0, 0, 0, global.encounter.attacks[random_range(0, array_length(global.encounter.attacks) - 1)]);
            }
        }
        global.attack_timer++;
        break;
    case BS_RESIZE_BOX:
        //Resizing Box to get ready for the pre attack stage
        soul.visible = false;
        global.border_width = 575;
        global.border_height = 130;
        if (obj_battle_box.current_width == 575 and obj_battle_box.current_height == 130) {
            global.battle_state = BS_SELECT_BUTTON;
        }
        break;
    //This might be the shittiest block of code ive ever written but just roll with it
    case BS_ACT_SELECT:
        if (global.btl_vertical_selection == 0 and global.btl_horizontal_selection == 0) {
            global.act_selected = 0;
        }
        if (global.btl_vertical_selection == 0 and global.btl_horizontal_selection == 1) {
            global.act_selected = 1;
        }
        if (global.btl_vertical_selection == 1 and global.btl_horizontal_selection == 0) {
            global.act_selected = 2;
        }
        if (global.btl_vertical_selection == 1 and global.btl_horizontal_selection == 1) {
            global.act_selected = 3;
        }
        battle_writer.text[0] = "";
        soul.x = 60 + (global.btl_horizontal_selection * 240);
        soul.y = 283 + (global.btl_vertical_selection * 33);
        var _amount_of_acts = array_length(global.encounter.acts[global.selected_monster]);
        if (key_right) {
            global.btl_horizontal_selection += 1;
        } else if (key_left) {
            global.btl_horizontal_selection -= 1;
        }
        if (key_down) {
            global.btl_vertical_selection += 1;
        } else if (key_up) {
           global.btl_vertical_selection -= 1;
        }
        if (key_accept) {
            global.battle_state = BS_ACT_BOX_DIALOGUE;
            if (global.encounter.acts[global.selected_monster][global.act_selected][1] > 0) {
                global.encounter.mercy[global.selected_monster] += global.encounter.acts[global.selected_monster][global.act_selected][1];
                var _mercy = instance_create_depth(global.encounter_bodies[global.selected_monster].x, global.encounter_bodies[global.selected_monster].y, -9999, obj_dmgwriter);
                _mercy.gold = true;
                _mercy.damage = global.encounter.acts[global.selected_monster][global.act_selected][1];
                _mercy.size = 2;
            }
            battle_writer.draw_char = 0;
            battle_writer.typing = true;
        }
        if (key_return) {
            global.battle_state = BS_SELECT_MONSTER;
            global.btl_vertical_selection = 0;
        }
        switch (array_length(global.encounter.acts[global.selected_monster])) {
            case 1:
                global.btl_vertical_selection = 0;
                global.btl_horizontal_selection = 0;
                break;
            case 2:
                global.btl_vertical_selection = 0;
                global.btl_horizontal_selection = clamp(global.btl_horizontal_selection, 0, 1);
                break;
            case 3:
                if (global.btl_horizontal_selection == 0) {
                    global.btl_vertical_selection = clamp(global.btl_vertical_selection, 0, 1);
                } else {
                    global.btl_vertical_selection = 0;
                }
                global.btl_horizontal_selection = clamp(global.btl_horizontal_selection, 0, 1);
                break;
            case 4:
                global.btl_horizontal_selection = clamp(global.btl_horizontal_selection, 0, 1);
                global.btl_vertical_selection = clamp(global.btl_vertical_selection, 0, 1);
                break
        }
        for (var i = 0; i < array_length(global.encounter.acts[global.selected_monster]); i++) {
            if (array_length(global.encounter.acts[global.selected_monster]) < 3) {
                battle_writer.text[0] += "  " + global.encounter.acts[global.selected_monster][i][0] + "      ";
            } else {
                if (i <= 1) {
                    battle_writer.text[0] += "  " + global.encounter.acts[global.selected_monster][i][0] + "      ";   
                }
                if (i == 2) {
                    battle_writer.text[0] += "\n";
                    battle_writer.text[0] += "  " + global.encounter.acts[global.selected_monster][i][0] + "   ";  
                }
                if (i == 3) {
                    battle_writer.text[0] += "  " + global.encounter.acts[global.selected_monster][i][0] + "    ";   
                }
            }
        }
        break;
    case BS_ACT_BOX_DIALOGUE:
        soul.visible = false;
        if (instance_exists(obj_writer)) {
            battle_writer.text = global.encounter.acts[global.selected_monster][global.act_selected][2];
            battle_writer.can_skip = true;
            battle_writer.can_accept = true;   
        } else {
            //TODO - If enemy has dialogue, do that before going to an attack
            global.battle_state = BS_ATTACK;
        }
        
        break;
    case BS_MERCY_SELECT:
        if (key_return) {
            global.battle_state = BS_SELECT_MONSTER;
            global.btl_vertical_selection = 0;
        }
        soul.visible = true;
        soul.y = 283 + (global.btl_vertical_selection * 33);
        battle_writer.text = ["  * Spare\n  * Defend"];
        
        if (key_down) {
            global.btl_vertical_selection += 1;
        } else if (key_up) {
           global.btl_vertical_selection -= 1;
        }
    
        if (key_accept) {
            if (global.btl_vertical_selection == 1) {
                global.tp_to += 16;
                global.battle_state = BS_ATTACK;
            }
        }
        
        if (global.encounter.can_flee) {
            global.btl_vertical_selection = clamp(global.btl_vertical_selection, 0, 1);
            battle_writer.text[0] += "\n  * Flee";
        } else {
            global.btl_vertical_selection = 0;
        }
        break;
    case BS_FLEEING:
        var _random = random_range(0, 1);
        battle_writer.text[0] = (_random == 0 ? "  * Escaped." : "  * I'm outa here.");
        break;
    case BS_SELECT_ITEM:
        battle_writer.draw_char = 99999;
        battle_writer.text = [""];
        
        if (key_down) {
            global.btl_vertical_selection = clamp(global.btl_vertical_selection + 1, 0, array_length(global.items) - 1);
        } else if (key_up) {
            global.btl_vertical_selection = clamp(global.btl_vertical_selection - 1, 0, array_length(global.items) - 1);
        }
        
        if (key_return) {
            global.battle_state = BS_SELECT_BUTTON;
        }
        if (key_accept) {
            global.battle_state = BS_ITEM_USE;
        }
        soul.visible = true;
    
        var start_index = max(0, min(global.btl_vertical_selection - 1, array_length(global.items) - 3));
        var end_index = min(start_index + 3, array_length(global.items));
    
        soul.x = 60;
        soul.y = 283 + (global.btl_vertical_selection - start_index) * 33;
    
        battle_writer.text[0] = "";
        for (var i = start_index; i < end_index; i++) {
            battle_writer.text[0] += "  * " + global.items[i].item_name + "\n";
        }
    
        if (start_index > 0) {
            draw_sprite(spr_item_scroll_arrow, 0, 580, 265 + sin(siner / 5) * 2);
        }
        if (end_index < array_length(global.items)) {
            draw_sprite_ext(spr_item_scroll_arrow, 0, 580, 370 - sin(siner / 5) * 2, 1, 1, 180, c_white, 1);
        }
    
        for (var i = 0; i < (end_index - start_index); i++) {
            var index = start_index + i;
            var img_index = (index == global.btl_vertical_selection) ? 0 : 1;
            draw_sprite_ext(spr_item_scroll_center, img_index, 580, 283 + i * 33, 1, 1, 0, c_white, 1);
        }
        break;
    case BS_ITEM_USE:
        soul.visible = false;
        if (instance_exists(obj_writer)) {
            battle_writer.visible = true;
            battle_writer.typing = true;
            battle_writer.can_accept = true;
        } else {
            global.battle_state = BS_ATTACK;
        }
        if (!item_used) { 
            with (global.items[global.btl_vertical_selection]) {
                event_user(0);
            }
            scr_remove_item(global.items[global.btl_vertical_selection]);
            if (array_length(global.items) == 0) {
                global.btl_selected_button = 0;
            }
            item_used = true;
        }
        break;
    case BS_DIALOGUE:
        break;
}

draw_set_alpha(fade_alpha);
draw_rectangle_color(0 + global.camerax, 0 + global.cameray, 640 + global.camerax, 480 + global.cameray, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);