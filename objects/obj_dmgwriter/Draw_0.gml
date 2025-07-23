delaytimer++;
mercytimer++;

// Start movement after delay
if (delaytimer == delay) {
    vspeed = -5 - random(2);
    hspeed = 8;
    vstart = vspeed;
    flip = 90;
}

// Movement update
if (delaytimer >= delay) {
    
    // Horizontal friction / slowdown
    if (hspeed > 0)
        hspeed -= 1;
    if (hspeed < 0)
        hspeed += 1;
    if (abs(hspeed) < 1)
        hspeed = 0;

    if (nohbounce)
        hspeed = 0;

    // Simulate bouncing
    if (bounces < 2)
        vspeed += 1;

    if (y > ystart && bounces < 2 && killactive == 0) {
        y = ystart;
        vspeed = vstart / 2;
        bounces += 1;
    }

    if (bounces >= 2 && killactive == 0) {
        vspeed = 0;
        y = ystart;
    }

    // Simulate squash/stretch (non-drawing effect logic retained if needed)
    if (stretchgo == 1)
        stretch += 0.4;

    if (stretch >= 1.2) {
        stretch = 1;
        stretchgo = 0;
    }

    // Kill animation trigger
    killtimer += 1;
    if (killtimer > 35)
        killactive = 1;

    if (killactive == 1) {
        kill += 0.08;
        y -= 4;
    }

    // Destroy instance when done
    if (kill > 1)
        instance_destroy();
}
if (gold) {
    draw_set_font(global.font_damage_numbers_gold);   
} else {
    draw_set_font(global.font_big_numbers);   
}
draw_set_color(c_white);
draw_set_alpha(1 - kill);
draw_text_transformed(x, y, string(damage) + (gold == true ? "%" : ""), ((2 - stretch) / 2) * size, ((stretch + kill) / 2) * size, 0);
draw_set_alpha(1);