var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);
var key_accept = keyboard_check_pressed(ord("Z"));

if (key_left) {
    selection -= 1;
} else if (key_right) {
    selection += 1;
}

if (key_accept and !delayed) {
    scr_text(choice_texts[selection]);
    instance_destroy();
}

selection = clamp(selection, 0, 1);

if (selection == 0) {
    soul_pos_x = 30;
} else if (selection == 1) {
    soul_pos_x = 190;
}

draw_sprite(spr_textbox, 0, 160, 192);
draw_set_font(fnt_main);
if (selection == 0) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_white);
}
draw_text(40, 180, choices[0]);
if (selection == 1) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_white);
}
draw_text(200, 180, choices[1]);
draw_set_color(c_white);
draw_sprite(spr_heartsmall, 0, soul_pos_x, 187);