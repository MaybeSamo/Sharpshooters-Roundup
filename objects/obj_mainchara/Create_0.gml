xspd = 0;
yspd = 0;
walk_spd = 2;
run_spd = 4;
spd = 2;
image_speed = 0;
running = false;
enter_climb = false;
face_sprites = {
    up: spr_krisu_dark,
    down: spr_krisd_dark,
    left: spr_krisl_dark,
    right: spr_krisr_dark
}
trail_length = 60;
trail = []
global.party_member_susie = i_create(x, y, obj_party_member);
global.party_member_susie.sprite_index = spr_susie_right;
global.party_member_susie.face_sprites = {
    right: spr_susie_right,
    left: spr_susie_left,
    up: spr_susie_up,
    down: spr_susie_down
}
global.party_member_ral = i_create(x, y, obj_party_member);
global.party_member_ral.sprite_index = spr_ralsei_walk_right;
global.party_member_ral.face_sprites = {
    right: spr_ralsei_walk_right,
    left: spr_ralsei_walk_left,
    up: spr_ralsei_walk_up,
    down: spr_ralsei_walk_down
}
global.party_member_ral.follow_index = 24;
global.can_move = true;
global.is_in_overworld = true;
global.sliding = false;