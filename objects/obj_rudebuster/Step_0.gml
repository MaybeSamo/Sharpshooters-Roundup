timer += 2;

image_angle = point_direction(x, y, target.x, target.y);
if (timer % 2 == 0) {
    var ai = instance_create_depth(x, y, depth + 1, obj_rudebuster_afterimage);
    ai.sprite_index = sprite_index;
    ai.image_index = image_index;
    ai.image_xscale = image_xscale;
    ai.image_yscale = image_yscale - 0.1;
    ai.image_angle = image_angle;
    ai.image_alpha = 0.8;   
}

if (x == target.x and y == target.y and con == 0) {
    event_user(0);
    con = 1;
    play_sound(snd_rudebuster_hit);
    instance_destroy();
}

if (con == 1) {
    for (var i = 0; i < 4; i += 1)
    {
        if (instance_exists(burst[i]))
        {
            with (burst[i])
            {
                image_yscale -= 0.1;
            }
        }
    }
    
    for (var i = 4; i < 8; i += 1)
    {
        if (instance_exists(burst[i]))
        {
            with (burst[i])
            {
                image_yscale -= 0.1;
            }
        }
    }
    
}