var border_l = 320 - (current_width / 2)
var border_r = 320 + (current_width / 2)
var border_u = 384 - current_height
var border_d = 384;
draw_set_color(c_white);
draw_rectangle(border_l - 5, border_u - 5, border_r + 5, border_d + 5, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

if (global.battle_state == BS_ATTACK) {
    obj_battle_soul.x = clamp(obj_battle_soul.x, border_l + 8, border_r - 8);
    obj_battle_soul.y = clamp(obj_battle_soul.y, border_u + 8, border_d - 8);      
}