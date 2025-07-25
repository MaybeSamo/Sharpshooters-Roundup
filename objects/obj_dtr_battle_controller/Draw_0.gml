timer += 1;
global.can_move = false;

var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);
var key_down = keyboard_check_pressed(vk_down);
var key_up = keyboard_check_pressed(vk_up);
var key_accept = keyboard_check_pressed(ord("Z"));
var key_return = keyboard_check_pressed(ord("X"));

ui_y += (ui_y_to - ui_y) / 3;


if (bg._bg_alpha < 1) {
    bg._bg_alpha += 0.075;   
}

switch (global.battle_state) {
    case DBS_ENTERING_BATTLE:
        if (timer % 2 == 0) {
            var _s = instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_dtr_battle_enter_sillouhete);
            _s.sprite_index = obj_mainchara.sprite_index;
            _s.image_speed = 0;
            var _s2 = instance_create_depth(obj_dtr_battle_enemy.x, obj_dtr_battle_enemy.y, obj_dtr_battle_enemy.depth, obj_dtr_battle_enter_sillouhete);
            _s2.sprite_index = enemy_obj.sprite_index;
            _s2.image_speed = 0;
        }
        with (obj_mainchara) {
            sprite_index = spr_kris_attack_ready;
            var _targetx = global.camerax + 63;
            var _targety = global.cameray + 109;
            var _dist = point_distance(x, y, _targetx, _targety);
            if (_dist < 12) {
                sprite_index = spr_kris_attack;
                image_speed = 1;
                hspeed = 0;
                vspeed = 0;
                x = _targetx;
                y = _targety;
                global.battle_state = DBS_INTRO_SLASH;
            } else {
                move_towards_point(_targetx, _targety, 12);
            }
        }
    
        with (obj_dtr_battle_enemy) {
        var _targetx = global.camerax + 240;
        var _targety = global.cameray + 109;
        
        // Distance to target
        var _dist = point_distance(x, y, _targetx, _targety);
        
        if (_dist < 6) {
            x = _targetx;
            y = _targety;
            speed = 0;
        } else {
            move_towards_point(_targetx, _targety, 6);
        }
        }
        break;
    case DBS_INTRO_SLASH:
        if (floor(obj_mainchara.image_index) >= obj_mainchara.image_number - 1) {
            global.battle_state = DBS_SELECT;
            obj_mainchara.sprite_index = spr_kris_battle_idle;
            audio_play_sound(mus_dtr_battle_2, 0, true);
        }
        break;
    case DBS_SELECT:
        if (!instance_exists(obj_writer)) {
            battle_writer = instance_create_depth(25, 185, -9999999, obj_writer);
            battle_writer.text = ["* /YTest enemy /Waproaches you!"];
            battle_writer.can_accept = false;
        }
        if (!instance_exists(obj_dtr_battle_char_info_drawer)) {
            party_member_info = instance_create_depth(120, 150, -9999999999999, obj_dtr_battle_char_info_drawer);
        }
    
        if (obj_dtr_battle_char_info_drawer.selected_button == 0 and key_accept) {
            play_sound(snd_select);
            global.battle_state = DBS_SELECT_MONSTER;
        }
    
        party_member_info.y = ui_y + 154;
        ui_y_to = 0;
        break;
    case DBS_SELECT_MONSTER:
        battle_writer.text = ["  Test Enemy"];
        enemy_obj.selected = true;
        break;
}
draw_set_color(c_black);
draw_rectangle(0, 480 + ui_y, 640, 158 + ui_y, false);
draw_set_color(make_color_rgb(51, 32, 51));
draw_line_width(0, 178 + ui_y, 640, 178 + ui_y, 1.5);
draw_line_width(0, 160 + ui_y, 640, 160 + ui_y, 1.5);
draw_set_color(c_white);