draw_set_font(global.font_damage_numbers);
draw_set_color(c_red);
draw_text(x + 26, y - 10, dmg);

dmg_to = clamp(dmg_to, 0, 99999999);

if (y > ystart)
{
    y = ystart;
    vspeed = 0;
    gravity = 0;
    alarm[0] = 30;
}

draw_set_color(c_white);

draw_set_color(c_black);
draw_rectangle(x - 1, ystart + 7, x + round((100 * stretch) + 1), ystart + 21, false);
draw_set_color(c_dkgray);
draw_rectangle(x, ystart + 8, x + round(100 * stretch), ystart + 20, false);
draw_set_color(c_lime);
draw_rectangle(x, ystart + 8, round(x + (dmg_to * stretch)), ystart + 20, false);

if (dmg_to > (hp - dmg)) {
    dmg_to -= (dmg)/ 15;   
}