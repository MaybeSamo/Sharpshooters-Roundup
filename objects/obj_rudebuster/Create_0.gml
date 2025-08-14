target = global.current_enemy[0];
scr_move_towards_point(self, target.x, target.y, 12);
play_sound(snd_rudebuster_swing);
image_xscale = 1;
image_yscale = 1;
timer = 0;
burst = [];
con = 0;