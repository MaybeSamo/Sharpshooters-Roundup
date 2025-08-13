ui_y_offset += (ui_y_offset_target - ui_y_offset) / 3;

draw_set_color(make_color_rgb(51, 32, 51));
draw_line_width(-3, 181 + ui_y_offset, 320, 181 + ui_y_offset, 1.5);
draw_line_width(-3, 163 + ui_y_offset, 320, 163 + ui_y_offset, 1.5);
draw_set_color(c_black);
draw_rectangle(0, 181+ ui_y_offset, 320, 163+ ui_y_offset, false);
draw_rectangle(0, 182.5 + ui_y_offset, 320, 240 + ui_y_offset, false);
draw_set_color(c_white);