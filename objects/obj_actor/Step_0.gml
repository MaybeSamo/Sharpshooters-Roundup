siner += 1;

if dir_sprite {
    switch dir {
    case "r":
        sprite_index = rsprite;
        break;
    case "l":
        sprite_index = lsprite;
        break;
    case "u":
        sprite_index = usprite;
        break;
    case "d":
        sprite_index = dsprite;
        break;
}   
}
if walking {
    switch dir {
        case "r":
            x += walk_speed;
            image_speed = walking_image_speed;
            break;
        case "l":
            x -= walk_speed;
            image_speed = walking_image_speed;
            break;
        case "u":
            y -= walk_speed;
            image_speed = walking_image_speed;
            break;
        case "d":
            y += walk_speed;
            image_speed = walking_image_speed;
            break;
    }   
}
if shaking {
    shake_offset_x = random_range(-shake_magnitude_x, shake_magnitude_x);
    shake_offset_y = random_range(-shake_magnitude_y, shake_magnitude_y);
    x += shake_offset_x;
    y += shake_offset_y;
}
if (use_sillouhete) {
    if (siner % 5 == 0) {
        var _s = instance_create_depth(x, y, depth + 1, obj_silliouhete);
        _s.sprite_index = sprite_index;
        _s.hspeed = 1;
        _s.image_alpha = 0.5;   
    }
}

x += siner_x_amp * sin(siner * siner_x_freq);
y += siner_y_amp * sin(siner * siner_y_freq);
show_debug_message(use_sillouhete);