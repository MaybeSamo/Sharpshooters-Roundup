ui_selection_y += (ui_selection_y_to - ui_selection_y) / 3;

draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, 640, 480, false);

// Reset alpha and draw font
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_main);

draw_text(100, 50, "Select Attack -");

ui_selection = clamp(ui_selection, 0, array_length(global.current_enemy[0].attacks) - 1);

if (keyboard_check_pressed(vk_down)) {
    play_sound(snd_squeak);
    ui_selection += 1;
    ui_selection_y_to += 20;
} else if keyboard_check_pressed(vk_up) {
    play_sound(snd_squeak);
    ui_selection -= 1;
    ui_selection_y_to -= 20;
}

draw_sprite_ext(spr_heart, 0, 90, ui_selection_y, 0.5, 0.5, 0, c_white, 1);

var attack_list = global.current_enemy[0].attacks;
var y_offset = 0;

for (var i = 0; i < array_length(attack_list); i++) {
    var obj_id = attack_list[i];
    var obj_name = object_get_name(obj_id);
    
    draw_text(100, 80 + (i * 20), obj_name);
}

if (keyboard_check_pressed(ord("Z"))) {
    play_sound(snd_select);
    global.battle_con = -1;
    global.battle_state = BattleState.Attack;
    i_create(0, 0, global.current_enemy[0].attacks[ui_selection]);
    instance_destroy();
}

if (keyboard_check_pressed(ord("X"))) {
    instance_destroy();
}