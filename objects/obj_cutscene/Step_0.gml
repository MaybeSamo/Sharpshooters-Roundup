textbox_exists = instance_exists(obj_writer)
if (event_index >= array_length(event_queue)) {
    return;
}
if (waiting) {
    wait_timer += 1;
    if (wait_timer >= wait_time) {
        waiting = false;
        event_index += 1;
    }
    return;
}
if (text_waiting) {
    if textbox_exists == false {
        event_index += 1;
        text_waiting = false;
    }
}
var command = event_queue[event_index];
var cmd = command[0];
switch(cmd) {
    case "add_actor": {
        var obj = command[1];
        var _x = command[2];
        var _y = command[3];
        var _depth = command[4];
        var name = command[5];
    
        var inst = instance_create_depth(_x, _y, _depth, obj);
        inst.char_name = name; // Assign name
        array_push(actors, inst);
        break;
    }
    case "sel_actor":
        var name = command[1];
        for (var i = 0; i < array_length(actors); i++) {
            if (actors[i].char_name == name) {
                active_actor = actors[i];
                break;
            }
        }
        break;
    case "image_index":
        active_actor.image_index = command[1];
        break;
    case "image_speed":
        active_actor.image_speed = command[1];
        break;
    case "sprite_index":
        active_actor.sprite_index = command[1];
        break;
    case "walk":
        active_actor.walking = command[1];
        break;
    case "walk_speed":
        active_actor.walk_speed = command[1];
        break;
    case "dir":
        active_actor.dir = command[1];
        break;
    case "use_dir_sprite":
        active_actor.dir_sprite = command[1];
        break;
    case "wait":
        waiting = true;
        wait_time = command[1];
        wait_timer = 0;
        break;
    case "destroy_actors":
        for (var i = 0; i < array_length(actors); i++) {
            instance_destroy(actors[i])
        }
        instance_destroy();
        break;
    case "shake":
        active_actor.shaking = command[1];
        break;
    case "shake_magnitude_x":
        active_actor.shake_magnitude_x = command[1];
        break;
    case "shake_magnitude_y":
        active_actor.shake_magnitude_y = command[1];
        break;
    case "msgpush":
        scr_text(command[1]);
        break;
    case "wait_talk":
        text_waiting = true;
        break;
    case "add_inst":
        instance_create_depth(command[1], command[2], command[3], command[4]);
        break;
    case "play_sound":
        play_sound(command[1]);
        break;
    case "end_cutscene":
        instance_destroy();
        if destroy_actors_on_end {
            c_destroy_actors();
        }
        break;
    case "remove_inst":
        instance_destroy(command[1]);
        break;
    case "image_scale":
        active_actor.image_xscale = command[1];
        active_actor.image_yscale = command[2];
        break;
    case "exec_func":
        function_exec = command[1];
        function_exec();
        break;
    case "var_inst_set":
        if (variable_instance_exists(command[1], command[2])) {
            variable_instance_set(command[1], command[2], command[3]);
        }
        break;
    case "set_global":
        if (variable_global_exists(command[1])) {
            variable_global_set(command[1], command[2]);
        }
        break;
    case "script_execute":
        script_execute(asset_get_index(command[1]));
        break;
    case "screen_shake":
        scr_shake(command[1], command[2]);
        break;
    case "cam_speed":
        if (instance_exists(obj_camera_controller)) {
            obj_camera_controller.h_speed = command[1];
            obj_camera_controller.v_speed = command[2];
        }
        break;
    case "cam_following":
        if (instance_exists(obj_camera_controller)) {
            global.camera_following = command[1];
        }
        break;
    case "set_siner_values":
        active_actor.siner_x_amp = command[1];
        active_actor.siner_x_freq = command[2];
        active_actor.siner_y_amp = command[3];
        active_actor.siner_y_freq = command[4];
        break;
}
if (!waiting && !text_waiting) {
    event_index++;
}