draw_sprite_ext(spr_press, 0, x, y, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(spr_kris_head, 0, x - 20, y, 0.5, 0.5, 0, c_white, 1);
draw_set_color(c_blue);
draw_rectangle(x + 10, y + 8, x + 60, y - 10, true);
draw_set_color(c_aqua);
draw_rectangle(x + 10, y + 8, x + 12, y - 10, true);
draw_set_color(c_white);