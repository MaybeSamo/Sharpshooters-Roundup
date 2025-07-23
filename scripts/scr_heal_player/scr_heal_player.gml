// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heal_player(heal){
    global.player_health += heal;
    play_sound(snd_heal);
}