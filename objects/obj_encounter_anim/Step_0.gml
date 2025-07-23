if flashing {
	timer++;
	if timer % 2 == 0 {
	flash = !flash;
	}
}

if soul_moving and x == 18 + global.camerax and y == 224 + global.cameray {
	room_goto(room_battle);
    instance_destroy();
}

if (soul_moving) {
    var target_x = 18 + global.camerax;
    var target_y = 224 + global.cameray;

    var dist = point_distance(x, y, target_x, target_y);

    if (dist < 12) {
        hspeed = 0;
        vspeed = 0;
        x = target_x;
        y = target_y;
    } else {
        move_towards_point(target_x, target_y, 12);
    }
}