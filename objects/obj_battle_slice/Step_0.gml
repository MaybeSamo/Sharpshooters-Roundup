if (image_index == 5) {
    var _i = instance_create_depth(cur_enemy.x + 10, cur_enemy.y - 30, -99999, obj_dmgwriter_battle);
    _i.hp = global.encounter.encounter_stats[global.btl_vertical_selection][1];
    _i.dmg_to = global.encounter.encounter_stats[global.btl_vertical_selection][1];
    _i.dmg = 20;
    global.encounter.encounter_stats[global.btl_vertical_selection][1] -= 20;
    play_sound(snd_hurt);
    instance_destroy();
}
