draw_set_font(fnt_main);
draw_text(10, 10, con);
draw_text(10, 30, timer);
draw_set_color(c_white);
draw_set_alpha(screen_flash);
draw_rectangle(0, 0, 640, 480, false);
draw_set_alpha(1);