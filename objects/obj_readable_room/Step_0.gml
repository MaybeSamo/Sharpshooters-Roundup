if (global.debug) {
    visible = true;    
} else {
    visible = false;
}

if (
    place_meeting(x, y, obj_mainchara) &&
    (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) &&
    !instance_exists(obj_writer)
) {
    for (var i = 0; i < array_length(text); i++) {
        scr_text(text[i]);
    }
}
