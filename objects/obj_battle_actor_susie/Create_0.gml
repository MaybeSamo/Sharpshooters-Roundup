name = "Susie";
icon_spr = spr_susie_head;
name_spr = spr_susie_name;
use_magic = true;
color = make_color_rgb(255, 0, 255);
action_sprites = {
    fight: spr_susie_attack_ic,
    act: spr_susie_act_ic,
    item: spr_susie_item_ic,
    defend: spr_susie_defend_ic,
    spare: spr_susie_spare_ic
}
actions = {
    
}
sprites = {
    idle: spr_susie_idle,
    attack_ready: spr_susie_attack_ready,
    attack: spr_susie_attack,
    act: noone,
    act_ready: spr_susie_act_ready,
    magic: spr_susie_spell,
    hurt: noone,
    magic: noone,
    item: noone,
    use_item: noone,
    defend: spr_susie_defend
}
actor_index = 1;
loop_animation = false;
spawned_dmg = false;