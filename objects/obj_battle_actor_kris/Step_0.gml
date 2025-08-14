if (i_ex(obj_dtr_battle_ui) and global.battle_state == BattleState.SelectAction) {
    if (array_length(global.party_member_actions) <= actor_index) {
        loop_animation = true;
        image_speed = 1;
        sprite_index = sprites.idle;
    } else if (actor_index >= 0 && actor_index < array_length(global.party_member_actions)) {
        switch (global.party_member_actions[actor_index]) {
            case 0:
                loop_animation = true;
                sprite_index = sprites.attack_ready;
                image_speed = 1;
                break;
            case 1:
                loop_animation = true;
                image_speed = 1;
                sprite_index = sprites.act_ready;
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                image_speed = 1;
                loop_animation = false;
                sprite_index = sprites.defend;
                break;
        }
    }   
}

if (!loop_animation) {
    if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
    }
}

if (i_ex(obj_dtr_battle_controller)) {
    if (sprite_index == sprites.attack and global.battle_state == BattleState.DoActions) {
        if (image_index >= image_number - 1) {
            if (!spawned_dmg) {
                play_sound(snd_hurt);
                spawned_dmg = true;
                var dmg = i_create(global.current_enemy[0].x, global.current_enemy[0].y, obj_dmgwriter);
                dmg.color = c_aqua;
                dmg.damage = 100;   
            }
        }
    }   
}

show_debug_message(loop_animation)