if (fadecon == 1) {
    if (fade_alpha < 0.5) {
        fade_alpha += 0.05;   
    }
}

if (fadecon == 2) {
    if (fade_alpha > 0) {
        fade_alpha -= 0.05;
    }
    if (fade_alpha == 0) {
        fadecon = 0;
    }
}

draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, 640, 480, false);
draw_set_alpha(1);
draw_set_color(c_white);