function c_add_actor(object, x, y, depth, name) {
    return ["add_actor", object, x, y, depth, name];
}

function c_sel_actor(actor) {
    return ["sel_actor", actor];
}

function c_image_index(index) {
    return ["image_index", index];
}

function c_image_speed(speed) {
    return ["image_speed", speed];
}

function c_sprite_index(index) {
    return ["sprite_index", index];
}

function c_dir(dir) {
    return ["dir", dir];
}

function c_use_dirsprite(value) {
    return ["use_dir_sprite", value]
}

function c_walk(state) {
    return ["walk", state];
}

function c_walk_speed(speed) {
    return ["walk_speed", speed];
}

function c_wait(frames) {
    return ["wait", frames];
}

function c_end_cutscene() {
    return ["end_cutscene"];
}

function c_destroy_actors() {
    return ["destroy_actors"];
}

function c_shake(state) {
    return ["shake", state];
}

function c_shake_magnitude_x(value) {
    return ["shake_magnitude_x", value];
}

function c_shake_magnitude_y(value) {
    return ["shake_magnitude_y", value];
}

function c_msgpush(text) {
    return ["msgpush", text];
}

function c_wait_talk() {
    return ["wait_talk"];
}

function c_add_inst(x, y, depth, object) {
    return ["add_inst", x, y, depth, object];
}

function c_play_sound(sound) {
    return ["play_sound", sound];
}

function c_tenna_speak(value) {
    return ["tenna_speak", value];
}

function c_remove_actors() {
    for (var i = 0; i < obj_cutscene.actors; i++) {
        instance_destroy(obj_cutscene.actors[i]);
    }
}
function c_remove_inst(object) {
    return ["remove_inst", object];
} 
function c_image_scale(x, y) {
    return ["image_scale", x, y]
}

function c_exec_func(func) {
    return ["exec_func", func];
}
function c_var_inst_set(instance_id, name, val) {
    return ["var_inst_set", instance_id, name, val];
}
function c_set_global(name, val) {
    return ["set_global", name, val];
}
function c_cam_following(val) {
    return ["cam_following", val];
}
function c_cam_speed(h_speed, v_speed) {
    return ["cam_speed", h_speed, v_speed];
}
function c_set_siner_values(amp_x, freq_x, amp_y, freq_y) {
    return ["set_siner_values", amp_x, freq_x, amp_y, freq_y];
}