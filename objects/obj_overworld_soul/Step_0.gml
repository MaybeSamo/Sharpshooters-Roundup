x = obj_mainchara.x + 1;
y = obj_mainchara.y + 3;

if (fade_in) {
    if (fade_alpha < 0.5) {
        fade_alpha += 0.1;
    }
    
    if (fade_alpha2 < 1) {
        fade_alpha2 += 0.1;
    }
    
    if (fade_alpha >= 0.5 and fade_alpha2 >= 1) {
        fade_in = false;
    }
}

if (fade_out) {
    if (fade_alpha > 0) {
        fade_alpha -= 0.1;
    } else {
        fade_alpha = 0;
    }

    if (fade_alpha2 > 0) {
        fade_alpha2 -= 0.1;
    } else {
        fade_alpha2 = 0;
    }

    if (fade_alpha <= 0 and fade_alpha2 <= 0) {
        instance_destroy();
    }
}
