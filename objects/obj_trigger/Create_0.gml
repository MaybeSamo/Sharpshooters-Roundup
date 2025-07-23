on_enter = function() {
    show_debug_message("trigger entered");
}

on_leave = function() {
    show_debug_message("trigger exited");
}

while_in = function() {
    show_debug_message("player inside trigger");
}

entered = false;
