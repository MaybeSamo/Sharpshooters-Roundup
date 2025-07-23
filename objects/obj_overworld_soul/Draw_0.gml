draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(global.camerax - 5, global.cameray, global.camerax + 640, global.cameray + 480, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_alpha(fade_alpha2);
switch (obj_mainchara.sprite_index) {
    case spr_krisd_dark:
        draw_sprite(spr_krisd_heart_outline, obj_mainchara.image_index, obj_mainchara.x, obj_mainchara.y);
        break;
    case spr_krisu_dark:
        draw_sprite(spr_krisu_heart_outline, obj_mainchara.image_index, obj_mainchara.x, obj_mainchara.y);
        break;
    case spr_krisl_dark:
        draw_sprite(spr_krisl_heart_outline, obj_mainchara.image_index, obj_mainchara.x, obj_mainchara.y);
        break;
    case spr_krisr_dark:
        draw_sprite(spr_krisr_heart_outline, obj_mainchara.image_index, obj_mainchara.x, obj_mainchara.y);
        break;
}
draw_sprite_ext(spr_heart_outline, 0, x, y, image_xscale, image_yscale, 0, c_white, fade_alpha2);
draw_set_alpha(1);