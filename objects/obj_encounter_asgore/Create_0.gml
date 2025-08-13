encounter_names = ["* Asgore"];
encounter_has_body = false;
encounter_bodies = [obj_finalfroggit_body];
//Element 0 = Defense, Health
encounter_stats = [[5, 100]];
attacks_randomized = true;
attacks = [obj_asgore_knife_attack];
state = 0;
box_dialogues = [["* Ribbit ribbit and all that"]];
mercy = [0];
can_flee = true;

acts = [scr_get_act_commands("Final Froggit")];

switch (array_length(encounter_bodies)) {
    case 1:
        global.encounter_bodies[0] = instance_create_depth(256, 128, 0, encounter_bodies[0]);
        break;
    case 2:
        global.encounter_bodies[0] = instance_create_depth(160, 128, 0, encounter_bodies[0]);
        global.encounter_bodies[1] = instance_create_depth(352, 128, 0, encounter_bodies[1]);
        break;
    case 3: 
        global.encounter_bodies[0] = instance_create_depth(96, 128, 0, encounter_bodies[0]);
        global.encounter_bodies[1] = instance_create_depth(256, 128, 0, encounter_bodies[1]);
        global.encounter_bodies[2] = instance_create_depth(416, 128, 0, encounter_bodies[2]);
        break;
        
}