if (locking) {
    image_angle = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y) + 90;
    direction = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y) + 90;
    launch_angle = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
}

if (!locking && shooting) {
    direction = launch_angle;
    speed = 60;
    shooting = false;
}

if (timer == 1) {
    locking = false;
    play_sound(snd_test);
    alarm[0] = 15;
}
event_inherited();

timer += 0.025;