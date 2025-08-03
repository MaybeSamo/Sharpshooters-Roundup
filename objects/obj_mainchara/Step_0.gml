var key_left = keyboard_check(vk_left);
var key_right = keyboard_check(vk_right);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);
var key_run = keyboard_check(ord("X"));

var moving = false;

if (key_run) {
    if (spd < run_spd) {
        spd += 0.2;
    }
} else {
    if (spd > walk_spd) {
        spd -= 0.2;
    }
}

spd = clamp(spd, walk_spd, run_spd);

if (global.can_move) {
    if (global.sliding) {
        xspd = (key_right - key_left) * spd;
        yspd = 0;
    } else {
        xspd = (key_right - key_left) * spd;
        yspd = (key_down - key_up) * spd;
    }
} else {
    xspd = 0;
    yspd = 0;
}

if (xspd != 0 && yspd == 0) {
    sprite_index = xspd > 0 ? face_sprites.right : face_sprites.left;
} else if (yspd != 0 && xspd == 0) {
    sprite_index = yspd > 0 ? face_sprites.down : face_sprites.up;
}

if (!place_meeting(x + xspd, y, obj_solid)) {
    x += xspd;
    if (xspd != 0) moving = true;
}

if (!place_meeting(x, y + yspd, obj_solid)) {
    y += yspd;
    if (yspd != 0) moving = true;
}

if (global.is_in_overworld and !global.sliding) {
    image_speed = moving ? (key_run ? 1 : 0.8) : 0;   
}

if (!moving and global.is_in_overworld) {
    image_index = 0;
}

if (moving) {
    array_insert(trail, 0, [x, y]);

    if (array_length(trail) > trail_length) {
        array_pop(trail); 
    }
}

if (global.sliding) {
    y += 7;
    sprite_index = spr_krisd_slide;
    image_speed = 1;
}

with (obj_actor) {
    if (char_name == "mc") {
        obj_mainchara.x = x;
        obj_mainchara.y = y;
        obj_mainchara.sprite_index = sprite_index;
    }
}