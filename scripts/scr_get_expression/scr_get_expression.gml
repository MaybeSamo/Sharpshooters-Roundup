// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_expression(argument0) {
    switch(argument0) {
        case "N1":
            return {
                sprite: spr_face_n_matome_13,
                sound: snd_txtnoe,
            }
        case "N2":
            return {
                sprite: spr_face_n_matome_14,
                sound: snd_txtnoe,
            }
        default:
            return {
                sprite: -1,
                sound: snd_nosound
            };
    }
}