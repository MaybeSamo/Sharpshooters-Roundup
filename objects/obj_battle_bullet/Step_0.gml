var grazing_radius = 32;
if (collision_circle(x, y, grazing_radius, obj_battle_soul, false, true) and grazed == false) {
    i_create(obj_battle_soul.x, obj_battle_soul.y, obj_graze);
    global.tp_to += 1;
    grazed = true;
}