// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_expression(argument0) {
    switch(argument0) {
        case "C0": return spr_face_catty_0;
        case "C1": return spr_face_catty_1;
        case "C2": return spr_face_catty_2;
        case "C3": return spr_face_catty_3;
        case "C4": return spr_face_catty_4;
        case "C5": return spr_face_catty_5;
        case "C6": return spr_face_catty_6;
        case "C7": return spr_face_catty_7;
        case "C8": return spr_face_catty_8;
        default:
            show_debug_message("scr_get_expression: Unknown expression: " + string(argument0));
            return -1;
    }
}