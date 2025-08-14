global.camerax = 0;
global.cameray = 0;
global.msg = [];
global.choice_options = [];
global.choice_msg = [];
global.debug = true;
global.prev_room = noone;
global.font_big_numbers = font_add_sprite_ext(spr_big_numbers, "0123456789", 20, 0);
global.font_damage_numbers = font_add_sprite_ext(spr_battle_damage, "0123456789", 20, 0);
global.font_damage_numbers_gold = font_add_sprite_ext(spr_numbersfontbig_gold, "0123456789+-%/", 20, 0);
global.dtr_small_numbers = font_add_sprite_ext(spr_small_numbers, "0123456789", 10, 1);
global.max_player_health = 20;
global.player_health = 10;
global.encounter = obj_encounter_asgore;
global.encounter_bodies = [];
global.name = "Chara";
global.lvl = 1;
global.gold = 0;
global.items = [obj_item];
global.party = [
    { name: "Kris", hp: 120 },
    { name: "Susie", hp: 120 },
    { name: "Ralsie", hp: 120 },
];
global.party_battle_actors = [obj_battle_actor_kris, obj_battle_actor_susie];
global.box_pos = "top";
global.plot = 0;
global.battle_ui = [];
global.current_enemy = [obj_sharpshooter_enemy];
global.party_member_actions = 0;
global.timing_lines = [];
shake_strength = 5;
shake_timer = 120;

window_set_size(640, 480);