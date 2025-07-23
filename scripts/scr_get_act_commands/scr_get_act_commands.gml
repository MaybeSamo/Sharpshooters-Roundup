#macro ACT_LIST_NAME 0
#macro ACT_LIST_MERCY_AMOUNT 1
#macro ACT_LIST_BOX_TEXT 2
#macro ACT_LIST_ENEMY_DIALOGUE 3

function scr_get_act_commands(encounter_name){
    switch (encounter_name) {
        case "Final Froggit":
            return [
                ["* Check", 0, ["* Final Froggit\n* 10 ATK 1 DEF^1\n* He fr js a chill guy ong."], noone],
                ["* Pacify", 50, ["* You hit Final Froggit with that\n  Sneaky lil mercy meter increase."], noone],
                ["* Pacify 2", 50, ["* You hit Final Froggit with that\n  Sneaky lil mercy meter increase 2."], noone]
            ]
    }
}
/*
                ["* Check", 0, ["* Final Froggit\n* 10 ATK 1 DEF^1\n* He fr js a chill guy ong."], noone],
                ["* Pacify", 50, ["* You hit Final Froggit with that\n  Sneaky lil mercy meter increase."], noone],
                ["* Pacify 2", 50, ["* You hit Final Froggit with that\n  Sneaky lil mercy meter increase 2."], noone],
                ["* Pacify 3", 50, ["* You hit Final Froggit with that\n  Sneaky lil mercy meter increase 3."], noone],