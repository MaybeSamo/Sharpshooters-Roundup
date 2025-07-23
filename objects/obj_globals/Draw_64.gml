if (global.debug) {
    var total_objects = 0;
    with (all) {
        total_objects += 1;
    }

    draw_set_font(fnt_mars_needs_bigger);

    scr_draw_chroma_text(0, 0, "FPS: " + string(fps), 0.05, 0);
    scr_draw_chroma_text(0, 20, "Objects in room: " + string(total_objects), 0.05, 100);
    if (variable_global_exists("attack_timer")) {
        scr_draw_chroma_text(0, 40, "Attack Timer: " + string(global.attack_timer), 0.05, 0);
    }

    draw_set_font(fnt_main);
    draw_set_color(c_white); // Reset color
}
