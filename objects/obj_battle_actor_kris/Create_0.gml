name = "Kris";
icon_spr = spr_kris_head;
name_spr = spr_kris_name;
action_sprites = {
    fight: spr_kris_attack_ic,
    act: spr_kris_act_ic,
    item: spr_kris_item_ic,
    defend: spr_kris_defend_ic,
    spare: spr_kris_spare_ic
}
use_magic = false;
color = c_aqua;
actor_index = 0;
loop_animation = true;
actions = {
    
}
sprites = {
    idle: spr_kris_battle_idle,
    attack_ready: spr_kris_attack_ready,
    attack: spr_kris_attack,
    act: spr_kris_act,
    act_ready: spr_kris_actready,
    hurt: noone,
    magic: noone,
    item: noone,
    use_item: noone,
    defend: spr_kris_defend
}