var key_right = keyboard_check(vk_right);
var key_left = keyboard_check(vk_left);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);

if (global.battle_state = BattleState.Attack) {
    hspeed = (key_right - key_left) * soul_spd;
    vspeed = (key_down - key_up) * soul_spd;   
}