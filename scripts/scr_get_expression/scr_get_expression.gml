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
        case "0":
            return {
                sprite: noone,
                sound: snd_generic_text,
            }
        case "S0" :
            return {
                sprite: spr_susie_nervous_side,
                sound: snd_txtsus
            }
        case "S1":
            return {
                sprite: spr_susie_neutral,
                sound: snd_txtsus
            }
        case "S2":
            return {
                sprite: spr_susie_netural_side,
                sound: snd_txtsus
            }
        case "R0":
            return {
                sprite: spr_ralsie_pensive,
                sound: snd_txtral
            }
        case "R1":
            return {
                sprite: spr_ralsei_owo_angry,
                sound: snd_txtral
            }
        default:
            return {
                sprite: -1,
                sound: snd_nosound
            };
    }
}