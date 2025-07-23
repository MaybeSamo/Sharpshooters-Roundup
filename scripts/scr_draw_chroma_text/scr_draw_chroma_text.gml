function scr_draw_chroma_text(x, y, str, speed, offset) {
    var len = string_length(str);
    var spacing = string_width("A"); // Estimate spacing between characters

    for (var i = 1; i <= len; i++) {
        var _chr = string_char_at(str, i);

        // Generate four hue values for each corner of the character
        var base_hue = (i * 30 + current_time * speed + offset) mod 360;
        
        var hue_tl = base_hue;
        var hue_tr = (base_hue + 30) mod 360;
        var hue_bl = (base_hue + 60) mod 360;
        var hue_br = (base_hue + 90) mod 360;

        // Convert hues to RGB
        var col_tl = make_color_hsv(hue_tl, 240, 240);
        var col_tr = make_color_hsv(hue_tr, 240, 240);
        var col_bl = make_color_hsv(hue_bl, 240, 240);
        var col_br = make_color_hsv(hue_br, 240, 240);

        // Draw the character with gradient colors
        draw_text_color(
            x + (i - 1) * spacing, y,
            _chr,
            col_tl, col_tr, col_bl, col_br,
            1 // Alpha
        );
    }
}
