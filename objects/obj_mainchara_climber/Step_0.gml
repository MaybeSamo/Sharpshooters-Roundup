var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);
var key_right = keyboard_check(vk_right);
var key_left = keyboard_check(vk_left);

y += (target_y - y) / climb_speed;
x += (target_x - x) / climb_speed;

if (!place_meeting(x, y, obj_climb_mount)) {
    exited_mount = true;
}

if (place_meeting(x, y, obj_climbable) or !exited_mount) {
    if (key_up or key_down or key_left or key_right) {
        climb_timer += 1;
    } else {
        climb_timer = 0;
    }
    
    if (climb_timer % 10 == 0 and climb_timer > 0) {
        audio_stop_sound(snd_wing);
        audio_play_sound(snd_wing, 0, false, 0.7, undefined, 1.1 + random(0.3));
        if (key_up) {
            target_y -= 20;
        } else if (key_down) {
            target_y += 20;
        } else if (key_right) {
            target_x += 20;
        } else if (key_left) {
            target_x -= 20;
        }
    }
    
    if (climb_timer == 1) {
        audio_stop_sound(snd_wing);
        audio_play_sound(snd_wing, 0, false, 0.7, undefined, 1.1 + random(0.3));
        if (key_up) {
            target_y -= 20;
        } else if (key_down) {
            target_y += 20;
        } else if (key_right) {
            target_x += 20;
        } else if (key_left) {
            target_x -= 20;
        }
        image_index += 1;
    }
    
    if (climb_timer > 0 ) {
        image_speed = 1;
    } else {
        image_speed = 0;
    }   
} else {
    play_sound(snd_test);
    instance_destroy();
    scr_move_towards_point(obj_mainchara, obj_mainchara.x, obj_mainchara.y + 20, 2);
    obj_mainchara.visible = true;
    global.can_move = true;
}