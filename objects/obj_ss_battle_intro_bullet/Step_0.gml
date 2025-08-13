siner += 0.25;

y = y + sin(siner) * 1.25;

image_alpha += 0.1;

var ai = i_create(x, y, obj_afterimage);
ai.sprite_index = sprite_index;

if (obj_ss_battle_intro.shoot_bullets) {
    scr_move_towards_point(self, -20, 195, 5);
}