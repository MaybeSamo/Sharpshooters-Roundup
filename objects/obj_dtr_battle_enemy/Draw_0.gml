var oldFog = gpu_get_fog();
draw_sprite(sprite_index, image_index, x, y);
gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, abs(sin(flash_timer)));
gpu_set_fog(oldFog[0], oldFog[1], oldFog[2], oldFog[3]);
