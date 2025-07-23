image_xscale = 0.5;
image_yscale = 0.5;
image_speed = 0;

use_exclamation = false;

if (use_exclamation) {
    flashing = false;
    alarm[0] = 15;
    play_sound(snd_exclamation);
} else {
    play_sound(snd_encounter);
    flashing = true;
    alarm[1] = 15;
}
global.can_move = false;
global.prev_room = room;
timer = 0;
flash = false;
soul_moving = false;

x = obj_mainchara.x;
y = obj_mainchara.y + 5;

image_alpha = 0;