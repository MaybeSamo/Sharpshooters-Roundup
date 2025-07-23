if (fade_state == "fade_out") {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        if (target_room != noone) {
            room_goto(target_room);
        }
        fade_state = "fade_in";
    }
} else if (fade_state == "fade_in") {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        fade_state = "none";
        instance_destroy();
    }
}
