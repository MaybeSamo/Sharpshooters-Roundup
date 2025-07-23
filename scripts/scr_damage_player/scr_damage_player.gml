// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_damage_player(amount){
    if (instance_exists(obj_mainchara)) {
        audio_play_sound(snd_damage, 0, false);
        scr_shake(1.5, 10);
        var _i = instance_create_depth(obj_mainchara.x, obj_mainchara.y, -99999, obj_dmgwriter);
        _i.damage = amount;
        global.player_health -= amount;
    }
    
    if (room == room_battle) {
        audio_play_sound(snd_damage, 0, false);
        scr_shake(1.5, 10);
        global.player_health -= amount;
    }
}