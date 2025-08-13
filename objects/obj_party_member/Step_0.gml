if (array_length(obj_mainchara.trail) > follow_index) {
    var pos = obj_mainchara.trail[follow_index];
    
    var prev_x = x;
    var prev_y = y;
    
    x = pos[0];
    y = pos[1];
    
    var dx = x - prev_x;
    var dy = y - prev_y;
    
    var moving = (dx != 0 || dy != 0);
    
    if (abs(dx) > abs(dy)) {
        sprite_index = (dx > 0) ? face_sprites.right : face_sprites.left;
    } else if (abs(dy) > 0) {
        sprite_index = (dy > 0) ? face_sprites.down : face_sprites.up;
    }

    image_speed = moving ? 0.8 : 0;
    if (!moving) {
        image_index = 0;
    }
}

if (sprite_index = face_sprites.up) {
    depth = obj_mainchara.depth - 99999;
} else {
    depth = 1;
}

if (obj_mainchara.sprite_index = obj_mainchara.face_sprites.up) {
    depth = 0;
}