if (icon_spr == spr_kris_head) {
    image_index = 0;
    whiteout_image_index = 3;
}
if (icon_spr == spr_susie_head) {
    image_index = 1;
    whiteout_image_index = 2;
}

if (flashcon == 1) {
    flash -= 0.1;
    if (flash <= 0) {
        flashcon = 0;
    }
}

if (keyboard_check_pressed(ord("Z"))) {
    flash = 1;
    flashcon = 1;
}

var smallest_x = 9999999999; // a very large number
var smallest_bar = noone;

for (var i = 0; i < array_length(global.timing_lines); i++) {
    var b = global.timing_lines[i];
    if (instance_exists(b)) {
        if (b.x < smallest_x) {
            smallest_x = b.x;
            smallest_bar = b;
        }
    }
}

if (instance_exists(smallest_bar)) {
    with (smallest_bar) {
        if (place_meeting(smallest_bar.x, smallest_bar.y, obj_dtr_fight_timing_ui)) {
            can_hit = true;
        }   
    }
}

draw_self();
draw_sprite_halfsize(spr_press, 0, x - 40, y + 1);
draw_sprite_halfsize(icon_spr, 0, x - 60, y + 1);
draw_sprite_ext(sprite_index, whiteout_image_index, x, y, image_xscale, image_yscale, 0, c_white, flash);

show_debug_message(smallest_bar);