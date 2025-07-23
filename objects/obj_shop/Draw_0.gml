draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite(spr_shopbg1, 0, 160, 64);
if (shop_state == 0) {
    draw_sprite_ext(spr_box, 0, 107.75, 182, 6.734375, 3.625, 0, c_white, 1);
    draw_sprite_ext(spr_box, 0, 265.75, 182, 3.390625, 3.625, 0, c_white, 1);
    draw_set_font(fnt_main);
    draw_text_ext(245, 135, "Buy\nSell\nTalk\nExit", string_height("A") + 2, 1000);
    draw_text(225, 215, "$150");
    draw_sprite(spr_heartsmall, 0, soul_pos_x, soul_pos_y);
}
if (shop_state == 1) {
    draw_sprite_ext(spr_box, 0, 265.75, item_info_y, 3.390625, 3.5, 0, c_white, 1);
    if (ui_selection <= 3) {
        draw_text_ext(225, item_info_y - 45, shop_items[ui_selection][2], string_height("A") + 2, 10000);
    }
    draw_sprite_ext(spr_box, 0, 107.75, 182, 6.734375, 3.625, 0, c_white, 1);
    draw_sprite_ext(spr_box, 0, 265.75, 182, 3.390625, 3.625, 0, c_white, 1);
    for(var i = 0; i < array_length(shop_items); i++) {
        draw_text(30, 132 + (i * 20), shop_items[i][0]);
        draw_text(160, 132 + (i * 20), "$" + string(shop_items[i][1]));
    }
    draw_text(30, 212, "Exit");
    draw_sprite(spr_heartsmall, 0, soul_pos_x, soul_pos_y);
    draw_text(225, 215, "$150");
    if (shop_sub_state == 1) {
        draw_text(225, 130, "Buy it for\n$" + string(shop_items[ui_selection][1]) + "?");
        draw_text(245, 170, "Yes\nNo");
    }
    writer.visible = false;
}
if (shop_state == 3 or shop_state == 2) {
    draw_sprite_ext(spr_box, 0, 160, 182, 10, 3.625, 0, c_white, 1);
}