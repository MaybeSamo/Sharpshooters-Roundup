if (!init)
{
    maxxscale *= 0.5;
    maxyscale *= 0.5;
    growscale *= 0.5;
    init = 1;
}

growth = 0;

if (timer < maxtimer && growcon == 1)
    growth = 1;

if (timer > 0 && growcon == 3)
    growth = 1;

if (growth == 1)
{
    if (growcon == 1)
        timer += 1;
    
    if (growcon == 3)
        timer -= 1;
    
    sizer = timer / maxtimer;
    image_xscale = maxxscale * sizer;
    image_yscale = maxyscale * sizer;
    image_angle = 180 + (180 * (timer / maxtimer)) + target_angle;
    image_alpha = 0.5 + ((timer / maxtimer) * 0.5);
    
    if (visible)
    {
        d = i_create(x, y, obj_afterimage);
        d.sprite_index = spr_custom_box;
        var _scale = sizer * growscale;
        d.image_xscale = _scale;
        d.image_yscale = _scale;
        d.image_angle = image_angle;
        d.depth = depth - 9999;
        d.image_blend = image_blend;
        d.image_alpha = (1 - image_alpha) + 0.1;
        d.image_speed = 0;
        d.fade_speed = 0.04;
    }
    
    if (timer >= maxtimer && growcon == 1)
    {
        growcon = 2;
        image_angle = target_angle;
        keep = 1;
    }
    
    if (timer <= 0 && growcon == 3)
        instance_destroy();
}
