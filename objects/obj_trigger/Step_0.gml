if (place_meeting(x, y, obj_mainchara)) {
    if (!entered) {
        on_enter();
        entered = true;
    }
    while_in();
}

if (!place_meeting(x, y, obj_mainchara) and entered) {
    on_leave();
    entered = false;
}