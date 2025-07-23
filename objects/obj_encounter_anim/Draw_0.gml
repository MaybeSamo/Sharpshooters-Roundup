if (use_exclamation) {
    draw_sprite_ext(spr_exclamation, 0, obj_mainchara.x, obj_mainchara.y - 42, 1, 1, 0, c_white, 1);   
}

if flash {
	draw_set_color(c_black);
	draw_rectangle(0 + global.camerax, 0 + global.cameray, 320 + global.camerax, 240 + global.cameray, false);
	draw_set_color(c_white);
	image_alpha = 1;
} else if !flash {
	image_alpha = 0;
}

draw_self();