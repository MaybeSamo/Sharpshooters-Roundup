target = obj_sharpshooter_enemy;
damage = 1;
star = 0;
caster = 0;
image_alpha = 0;
image_xscale = 1;
image_yscale = 1;
image_speed = 1;

for (i = 0; i < 10; i += 1)
{
    prevx[i] = x;
    prevy[i] = y;
}

a = 0;
targetx = 0;
targety = 0;
t = 0;
tmax = 4;
siner = 0;
speedmax = 2;
explode = 0;
maxaft = 0;
bolt_timer = 0;
chosen_bolt = 0;
final_bolt = 0;
lockdamage = false;
red = 0;
battlemode = 0;

hurtflashalpha = 0;
gersonswingtimer = 0;
gersonoffset = 0;
misswritercreated = false;
