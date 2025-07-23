draw_self();

if (entering_battle) {
    if (timer == 0) {
        play_sound(snd_tensionhorn);
        sprite_index = entering_battle_sprite;
    }
    timer += 1;
    
    if (timer == 20) {
        var _i = instance_create_depth(0, 0, -9999, obj_encounter_anim);
        _i.use_exclamation = false;
    }
}

if (chase_player && !entering_battle) {
    move_towards_point(obj_mainchara.x, obj_mainchara.y, 2);
}

if (!collision_line(x, y, obj_mainchara.x, obj_mainchara.y, obj_solid, true, true) and !spotting and !chase_player and !entering_battle) {
    alarm[0] = 15;
    play_sound(snd_exclamation);
    spotting = true;
} else {
    
}

if (spotting) {
    draw_sprite(spr_exclamation, 0, x + 5, y - 25);
}