if (place_meeting(x, y, obj_mainchara)) {
    if (!entered) {
        if (!instance_exists(obj_overworld_soul)) {
            instance_create_depth(obj_mainchara.x, obj_mainchara.y, -999999, obj_overworld_soul);   
        }
        entered = true;
    }
}

if (!place_meeting(x, y, obj_mainchara) and entered) {
    with (obj_overworld_soul) {
        if (!fade_in) {
            fade_out = true;
        } else {
            instance_destroy();
        }
    }
    entered = false;
}