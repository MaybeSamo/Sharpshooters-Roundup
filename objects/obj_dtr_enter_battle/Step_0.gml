timer += 1;

switch (battle_intro_state) {

    //MOVE ACTORS TO POSITION
    case 0:
        if (array_length(global.party_battle_actors) == 1) {
            scr_move_towards_point(global.party_battle_actors[0], one_actor_target_pos[0], one_actor_target_pos[1], 5);
        }

        if (array_length(global.party_battle_actors) == 2) {
            scr_move_towards_point(global.party_battle_actors[0], two_actor_target_pos[0], two_actor_target_pos[1], 5);
            scr_move_towards_point(global.party_battle_actors[1], two_actor_target_pos[2], two_actor_target_pos[3], 5);
        }

        // Check if all are at target
        var all_at_target = true;
        if (array_length(global.party_battle_actors) == 1) {
            if (point_distance(global.party_battle_actors[0].x, global.party_battle_actors[0].y, one_actor_target_pos[0], one_actor_target_pos[1]) > 1)
                all_at_target = false;
        }
        if (array_length(global.party_battle_actors) == 2) {
            if (point_distance(global.party_battle_actors[0].x, global.party_battle_actors[0].y, two_actor_target_pos[0], two_actor_target_pos[1]) > 1)
                all_at_target = false;
            if (point_distance(global.party_battle_actors[1].x, global.party_battle_actors[1].y, two_actor_target_pos[2], two_actor_target_pos[3]) > 1)
                all_at_target = false;
        }

        // If all actors have arrived switch to attack animation
        if (all_at_target) {
            for (var i = 0; i < array_length(global.party_battle_actors); i++) {
                global.party_battle_actors[i].sprite_index = global.party_battle_actors[i].sprites.attack;
                global.party_battle_actors[i].image_index = 0;
                global.party_battle_actors[i].image_speed = 1;
            }
            play_sound(snd_battle_enter);
            battle_intro_state = 1;
        }
    break;


    // ---------------------------
    // 1 — WAIT FOR ATTACK ANIMATION TO FINISH
    // ---------------------------
    case 1:
    
        var all_done = true;
            if (global.party_battle_actors[0].image_index < global.party_battle_actors[0].image_number - 1) {
                all_done = false;
                break;
            }
    
        if (all_done) {
            // Switch all actors to idle sprites
            for (var i = 0; i < array_length(global.party_battle_actors); i++) {
                var actor = global.party_battle_actors[i];
                actor.sprite_index = actor.sprites.idle;
                actor.image_index = 0;
                actor.image_speed = 1; 
            }
    
            // Spawn UI
            instance_create_depth(0, 0, -9999, obj_dtr_battle_ui);
            instance_create_depth(0, 0, -9999, obj_dtr_battle_controller);
            battle_intro_state = 2;
        }
    break;

    case 2:
    break;
}


if (battle_intro_state <= 1) {
    if (timer % 2 == 0) {
        for (var i = 0; i < array_length(global.party_battle_actors); i++) {
            var ai = instance_create_depth(global.party_battle_actors[i].x, global.party_battle_actors[i].y, global.party_battle_actors[i].depth + 1, obj_afterimage);
            ai.sprite_index = global.party_battle_actors[i].sprite_index;
            ai.image_index = global.party_battle_actors[i].image_index;
            ai.image_alpha = 1;
            ai.alpha_speed = 0.05;
        }
    }
}
