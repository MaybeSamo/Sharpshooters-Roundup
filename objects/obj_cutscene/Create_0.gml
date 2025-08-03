initialized = false;
actors = [];
active_actor = 0;
event_queue = [];
waiting = false;
text_waiting = false;
wait_if = false;
value_to_comp = 0;
comp = "";
value_to_comp2 = 0;
wait_timer = 0;
wait_time = 0;
music = 0;
event_index = 0;
destroy_actors_on_end = false;
textbox_exists = 0;
function_exec = function() {
    show_debug_message("func");
}