timer += 1;

if (timer % 2 == 0 and con == 0) {
    var ai = instance_create_depth(x, y, -99999999999, obj_afterimage);
    ai.sprite_index = sprite_index;
    ai.fade_speed = 0.05;
    ai.image_xscale = 0.5;
    ai.image_yscale = 0.5;
}

if (con == 1) {
    hspeed = 0;
    image_xscale += 0.03;
    image_yscale += 0.03;
    image_alpha -= 0.08;
}

if (keyboard_check_pressed(ord("Z")) and can_hit and con == 0) {
    target_actor.loop_animation = false;
    target_actor.image_index = 0;
    target_actor.sprite_index = target_actor.sprites.attack;
    play_sound(snd_laz);
    con = 1;
}