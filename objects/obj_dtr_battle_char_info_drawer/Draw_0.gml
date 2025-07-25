timer += 1;

var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);
var key_down = keyboard_check_pressed(vk_down);
var key_up = keyboard_check_pressed(vk_up);
var key_accept = keyboard_check_pressed(ord("Z"));
var key_return = keyboard_check_pressed(ord("X"));

if (key_right) {
    selected_button += 1;
    play_sound(snd_squeak);
} else if (key_left) {
    selected_button -= 1;
    play_sound(snd_squeak);
}

if (selected_button > 4) {
    selected_button = 0;
} else if (selected_button < 0) {
    selected_button = 4;
}

if (timer % 10 == 0) {
    var _r = instance_create_depth(x, y + 6, -999999999, obj_dtr_battle_char_info_line);
    _r.hspeed = 0.75;
    _r.color = outline_color;
    _r.depth = depth - 1;
    var _l = instance_create_depth(x + 102, y + 6, -999999999, obj_dtr_battle_char_info_line);
    _l.hspeed = -0.75;
    _l.color = outline_color;
    _l.depth = depth - 1;
}

draw_set_color(c_black);
draw_rectangle(x - 8.5, y - 10.65, x + 91.5, y + 7, false);
draw_set_color(c_white);
draw_sprite_ext(spr_dtr_fight, selected_button == 0 ? 1 : 0, x + 5, y + 17, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_dtr_act, selected_button == 1 ? 1 : 0, x + 23, y + 17, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_dtr_item, selected_button == 2 ? 1 : 0, x + 41, y + 17, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_dtr_spare, selected_button == 3 ? 1 : 0, x + 59, y + 17, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_dtr_defend, selected_button == 4 ? 1 : 0, x + 77, y + 17, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(head_icon_spr, 0, x, y, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(name_icon_spr, 0, x + 23, y, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_dtr_hp, 0, x + 46, y + 2, 0.5, 0.5, 0, c_white, 1);
draw_set_font(global.dtr_small_numbers);
draw_text_transformed(x + 58, y - 5, 120, 0.5, 0.5, 0);
draw_text_transformed(x + 78, y - 5, 120, 0.5, 0.5, 0);
draw_sprite_ext(spr_dtr_slash, 0, x + 71, y - 5, 0.5, 0.5, 0, c_white, 1);
draw_rectangle_color(x + 90, y, x + 50, y + 3.5, outline_color, outline_color, outline_color, outline_color, false);
draw_set_color(outline_color);
draw_line_width(x - 10, y + 6, x + 92, y + 6, 1.25);
draw_line_width(x - 10, y - 12.5, x + 92, y - 12.5, 1.25);
draw_line_width(x - 10, y + 6.3, x - 10, y - 13, 1.25);
draw_line_width(x + 92, y + 6.3, x + 92, y - 13, 1.25);
draw_line_width(x + 92, y, x + 92, y + 23, 1.25);
draw_line_width(x - 10, y, x - 10, y + 23, 1.25);
draw_set_color(c_white);