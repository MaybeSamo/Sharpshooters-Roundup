draw_sprite_ext(spr_box_smaller, 0, global.camerax + 160, damage_ui_y, 3, 1.35, 0, c_aqua, 1);

draw_set_color(c_white);
draw_set_font(fnt_main);
draw_text(global.camerax + 120, global.cameray + damage_ui_y - 15, "Chara");
draw_set_font(fnt_mars_needs);
draw_text(global.camerax + 120, global.cameray + damage_ui_y, "HP  " + string(global.player_health) + "/" + string(global.max_player_health));

draw_set_color(c_red);
draw_rectangle(global.camerax + 120, global.cameray + damage_ui_y + 9, global.camerax + 170, global.cameray + damage_ui_y + 13, false);

var hp_bar_width = (global.player_health / global.max_player_health) * (170 - 120);

draw_set_color(c_aqua);
draw_rectangle(global.camerax + 120, global.cameray + damage_ui_y + 9, global.camerax + 120 + hp_bar_width, global.cameray + damage_ui_y + 13, false);

// Reset color
draw_set_color(c_white);
