image_xscale += (scale_x_to - image_xscale) / 4;
image_yscale += (scale_y_to - image_yscale) / 4;
x += (x_to - x) / 7;


siner += 1;

if (black_fade_out) {
    black_fade -= 0.15;    
} 

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
// Start shake (somewhere in your game, you set `shaking = true;` to trigger it)
if (shaking) {
    if (shake_timer == 0) {
        // store base position only once, at start of shake
        x_base = x;
        y_base = y;
    }

    shake_timer++;

    // apply shake offset
    shake_offset_x = random_range(-shake_magnitude_x, shake_magnitude_x);
    shake_offset_y = random_range(-shake_magnitude_y, shake_magnitude_y);

    x = x_base + shake_offset_x;
    y = y_base + shake_offset_y;

    // end shake after duration
    if (shake_timer >= shake_duration) {
        shaking = false;
        shake_timer = 0;
        x = x_base;
        y = y_base;
    }
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