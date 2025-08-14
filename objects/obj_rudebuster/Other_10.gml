for (var i = 0; i < 4; i += 1)
{
    burst[i] = scr_afterimage();
    burst[i].fade_speed = 0;
    burst[i].scale_speed = -0.1;
    burst[i].image_speed = 0.5;
    burst[i].x = x;
    burst[i].y = y;
    burst[i].image_angle = 45 + (i * 90);
    burst[i].direction = burst[i].image_angle;
    burst[i].speed = 12.5;
    burst[i].depth = depth - 10;
}

for (var i = 4; i < 8; i += 1)
{
    burst[i] = scr_afterimage();
    burst[i].fade_speed = 0;
    burst[i].scale_speed = -0.1;
    burst[i].image_speed = 0.5;
    burst[i].x = x;
    burst[i].y = y;
    burst[i].image_angle = 45 + (i * 90);
    burst[i].direction = burst[i].image_angle;
    burst[i].speed = 12.5;
    burst[i].depth = depth - 10;
}
