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
    }
}