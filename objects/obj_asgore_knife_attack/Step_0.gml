var spawn_x, spawn_y;
var center_x = 320;
var center_y = 240;
var min_radius = 100;

do {
    spawn_x = random_range(0, 640);
    spawn_y = random_range(0, 300);
} until (point_distance(spawn_x, spawn_y, center_x, center_y) > min_radius);

if (global.attack_timer % 30 == 0) {
    instance_create_depth(spawn_x, spawn_y, -9999999, obj_asgore_knife);
}

if (global.attack_timer == 100) {
    scr_end_attack(); 
}