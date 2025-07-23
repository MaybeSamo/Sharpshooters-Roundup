if (!instance_exists(obj_writer) and array_length(global.msg) != 0) {
    var _t = instance_create_depth(0, 0, -9999999999, obj_writer);
    _t.use_box = true;
    _t.text = global.msg;
}

for (var i = 0; i < array_length(global.items); i++) {
    if (!instance_exists(global.items[i])) {
        instance_create_depth(0, 0, 0, global.items[i]);
    }
}

global.player_health = clamp(global.player_health, 0, global.max_player_health);

global.camerax = camera_get_view_x(view_camera[0]);
global.cameray = camera_get_view_y(view_camera[0]);