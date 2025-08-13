// Declare these somewhere persistent, e.g. create event or globally
// starting offset values (usually 0)

// Each step (e.g., step event or before drawing), ease offset towards target:
var ease_amount = 2; // bigger = slower easing
var key_left = keyboard_check_pressed(vk_left);
var key_right = keyboard_check_pressed(vk_right);

//Sprites
if (selecting_ui) {
    if (key_right) {
        play_sound(snd_squeak);
        ui_selection += 1;
    } else if (key_left) {
        play_sound(snd_squeak);
        ui_selection -= 1;
    }
    if (ui_selection > 4) {
        ui_selection = 0;
    } else if (ui_selection < 0) {
        ui_selection = 4;
    }
    draw_sprite_halfsize(spr_dtr_fight, ui_selection == 0 ? 1 : 0, x + 3, y - 0.5);
    draw_sprite_halfsize(spr_dtr_act, ui_selection == 1 ? 1 : 0, x + 20.5, y - 0.5);
    draw_sprite_halfsize(spr_dtr_item, ui_selection == 2 ? 1 : 0, x + 38, y - 0.5);
    draw_sprite_halfsize(spr_dtr_spare, ui_selection == 3 ? 1 : 0, x + 55.5, y - 0.5);
    draw_sprite_halfsize(spr_dtr_defend, ui_selection == 4 ? 1 : 0, x + 73, y - 0.5);
    draw_sprite_ext(spr_deltarune_battle_info, 0, x + 41, y + 4 + offset_y, 0.5, 0.5, 0, actor.color, 1);   
    draw_sprite_ext(spr_deltarune_battle_info, 1, x + 41, y - 12, 0.5, 0.5, 0, actor.color, 1);
}
draw_set_color(c_white);
if (array_length(global.party_member_actions) <= ui_index) {
    draw_sprite_halfsize(actor.icon_spr, 0, x + offset_x, y - 2 + offset_y);   
} else if (ui_index >= 0 && ui_index < array_length(global.party_member_actions)) {
    switch (global.party_member_actions[ui_index]) {
        case 0:
            draw_sprite_halfsize(actor.action_sprites.fight, 0, x + offset_x, y - 2 + offset_y);
            break;
        case 1:
            draw_sprite_halfsize(actor.action_sprites.act, 0, x + offset_x, y - 2 + offset_y);
            break;
        case 2:
            draw_sprite_halfsize(actor.action_sprites.item, 0, x + offset_x, y - 2 + offset_y);
            break;
        case 3:
            draw_sprite_halfsize(actor.action_sprites.spare, 0, x + offset_x, y - 2 + offset_y);
            break;
        case 4:
            draw_sprite_halfsize(actor.action_sprites.defend, 0, x + offset_x, y - 2 + offset_y);
            break;
    }
}
draw_sprite_halfsize(actor.name_spr, 0, x + 22 + offset_x, y - 3 + offset_y);
draw_sprite_halfsize(spr_dtr_hp, 0, x + 45 + offset_x, y + offset_y);
draw_sprite_halfsize(spr_dtr_slash, 0, x + 70 + offset_x, y - 7 + offset_y);

//Text (Hp and such)
draw_set_font(global.dtr_small_numbers);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_text_transformed(x + 67 + offset_x, y - 4.5 + offset_y, hp, 0.5, 0.5, 0);
draw_text_transformed(x + 90 + offset_x, y - 4.5 + offset_y, hp, 0.5, 0.5, 0);

var bar_x = x + 50 + offset_x;
var bar_y = y - 2.5 + offset_y;
var bar_width = 37;
var bar_height = 3.5;
var health_width = (hp / max_hp) * bar_width;
var back_health_width = (max_hp / max_hp) * bar_width;

draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + back_health_width, bar_y + bar_height, false);
draw_set_color(actor.color);
draw_rectangle(bar_x, bar_y, bar_x + health_width, bar_y + bar_height, false);

// Reset draw settings
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 1. Decide target position based on selection
if (selecting_ui) {
    offset_y_target = selecting_y;
} else {
    offset_y_target = not_selecting_y;
}

// 2. Ease towards the target
// Lower divisor = faster, higher divisor = smoother
offset_y += (offset_y_target - offset_y) / 3;
y += (target_y - y) / 3;