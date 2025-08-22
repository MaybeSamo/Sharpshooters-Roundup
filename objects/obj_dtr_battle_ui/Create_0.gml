off_screen_offset = 100;
ui_y_offset = off_screen_offset;
ui_y_offset_target = 0;
party_ui = [];
var count = array_length(global.party_battle_actors);
var positions;


// Pick positions based on party size
if (count == 1) {
    positions = [
        [119, 176]
    ];
} else if (count == 2) {
    positions = [
        [67, 176],
        [174, 176]
    ];
} else if (count >= 3) {
    positions = [
        [12, 176],
        [119, 176],
        [225, 176]
    ];
}

// Create instances for each position
for (var i = 0; i < array_length(positions); i++) {
    var pos = positions[i];
    var xx = pos[0];
    var yy = pos[1];

    var inst = instance_create_depth(xx, yy, -9999, obj_battle_player_info_ui);
    if (i == 1) {
        inst.use_magic = true;
    }
    inst.actor = global.party_battle_actors[i];
    inst.ui_index = i;
    array_push(global.battle_ui, inst);
}