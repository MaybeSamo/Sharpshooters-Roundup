t = 0;
con = 0;
target = global.current_enemy[0];

if (i_ex(obj_battle_actor_susie)) {
    depth = obj_battle_actor_susie.depth - 999;
    obj_battle_actor_susie.visible = false;
}