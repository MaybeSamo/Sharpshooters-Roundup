function c_add_actor(object, x, y, depth, name) {
    array_push(obj_cutscene.event_queue, ["add_actor", object, x, y, depth, name]);
}

function c_sel_actor(actor) {
    array_push(obj_cutscene.event_queue, ["sel_actor", actor]);
}

function c_image_index(index) {
    array_push(obj_cutscene.event_queue, ["image_index", index]);
}

function c_image_speed(speed) {
    array_push(obj_cutscene.event_queue, ["image_speed", speed]);
}

function c_sprite_index(index) {
    array_push(obj_cutscene.event_queue, ["sprite_index", index]);
}

function c_dir(dir) {
    array_push(obj_cutscene.event_queue, ["dir", dir]);
}

function c_use_dirsprite(value) {
    array_push(obj_cutscene.event_queue, ["use_dir_sprite", value]);
}

function c_walk(state) {
    array_push(obj_cutscene.event_queue, ["walk", state]);
}

function c_walk_speed(speed) {
    array_push(obj_cutscene.event_queue, ["walk_speed", speed]);
}

function c_wait(frames) {
    array_push(obj_cutscene.event_queue, ["wait", frames]);
}

function c_end_cutscene() {
    array_push(obj_cutscene.event_queue, ["end_cutscene"]);
}

function c_destroy_actors() {
    array_push(obj_cutscene.event_queue, ["destroy_actors"]);
}

function c_shake(state) {
    array_push(obj_cutscene.event_queue, ["shake", state]);
}

function c_shake_magnitude_x(value) {
    array_push(obj_cutscene.event_queue, ["shake_magnitude_x", value]);
}

function c_shake_magnitude_y(value) {
    array_push(obj_cutscene.event_queue, ["shake_magnitude_y", value]);
}

function c_msgpush(text) {
    array_push(obj_cutscene.event_queue, ["msgpush", text]);
}

function c_wait_talk() {
    array_push(obj_cutscene.event_queue, ["wait_talk"]);
}

function c_add_inst(x, y, depth, object) {
    array_push(obj_cutscene.event_queue, ["add_inst", x, y, depth, object]);
}

function c_play_sound(sound) {
    array_push(obj_cutscene.event_queue, ["play_sound", sound]);
}

function c_tenna_speak(value) {
    array_push(obj_cutscene.event_queue, ["tenna_speak", value]);
}

function c_remove_actors() {
    array_push(obj_cutscene.event_queue, ["remove_actors"]);
}

function c_remove_inst(object) {
    array_push(obj_cutscene.event_queue, ["remove_inst", object]);
}

function c_image_scale(x, y) {
    array_push(obj_cutscene.event_queue, ["image_scale", x, y]);
}

function c_exec_func(func) {
    array_push(obj_cutscene.event_queue, ["exec_func", func]);
}

function c_var_inst_set(instance_id, name, val) {
    array_push(obj_cutscene.event_queue, ["var_inst_set", instance_id, name, val]);
}

function c_set_global(name, val) {
    array_push(obj_cutscene.event_queue, ["set_global", name, val]);
}

function c_cam_following(val) {
    array_push(obj_cutscene.event_queue, ["cam_following", val]);
}

function c_cam_speed(h_speed, v_speed) {
    array_push(obj_cutscene.event_queue, ["cam_speed", h_speed, v_speed]);
}

function c_set_siner_values(amp_x, freq_x, amp_y, freq_y) {
    array_push(obj_cutscene.event_queue, ["set_siner_values", amp_x, freq_x, amp_y, freq_y]);
}
function c_wait_if(arg0, arg1, arg2) {
    array_push(obj_cutscene.event_queue, ["wait_if", arg0, arg1, arg2])
}
function c_get_actor(name) {
    for (var i = 0; i < array_length(obj_cutscene.actors); i++) {
        var actor = obj_cutscene.actors[i];
        show_debug_message("Checking actor: " + string(actor.char_name));
        if (actor.char_name == name) {
            show_debug_message("Found actor: " + name);
            return actor;
        }
    }
    show_debug_message("Actor not found: " + name);
    return undefined;
}
function c_set_speed(arg0, arg1) {
    array_push(obj_cutscene.event_queue, ["set_speed", arg0, arg1]);
}
function c_move_towards_point(x, y, spd) {
    array_push(obj_cutscene.event_queue, ["move_towards_point", x, y, spd]);
}