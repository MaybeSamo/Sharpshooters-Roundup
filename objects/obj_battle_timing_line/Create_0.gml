image_speed = 0;
side = round(random_range(0, 1));
depth = -2;
y = 320;
if (side == 0) {
    x = 32;
    hspeed = 15;
} else if (side == 1) {
    x = 608;
    hspeed = -15;
}
slashed = false;