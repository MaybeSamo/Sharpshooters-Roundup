if (con == 0) {
    if (image_index >= image_number - 1) {
        sprite_index = spr_susie_rudebuster;
        image_speed = 0;
        image_index = 0;
        con = 1;
    }
}

if (con == 1) {
    image_index = t / 2;

    t += 1;
    
    if (i_ex(target))
    {
        if (t == 10)
        {
            play_sound(snd_rudebuster_swing);
            blast = i_create(x + 40, y + 15, obj_rudebuster);
        }
        if (t >= 28) {
            instance_destroy();
            obj_battle_actor_susie.visible = true;
        }
    }   
}