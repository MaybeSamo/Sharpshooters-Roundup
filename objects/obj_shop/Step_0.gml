var key_down = keyboard_check_pressed(vk_down);
var key_up = keyboard_check_pressed(vk_up);
var key_accept = keyboard_check_pressed(ord("Z"));

shopkeeper_object.x += (shopkeeper_xto - shopkeeper_object.x) / 5;
shopkeeper_object.y += (shopkeeper_yto - shopkeeper_object.y) / 5;
item_info_y += (item_info_yto - item_info_y) / 5;

if (instance_exists(obj_writer)) {
    if (shop_state == 0 or shop_state == 3 or shop_state == 2) {
        if (!writer.done) {
            shopkeeper_object.sprite_index = shopkeeper_talking_sprite;
        } else {
            shopkeeper_object.sprite_index = shopkeeper_sprite;
        }      
    }
}

if (key_down) {
    if (shop_sub_state == 0) {
        ui_selection += 1;   
    }
    if (shop_sub_state == 1) {
        ui_sub_selection += 1;
    }
} else if (key_up) {
    if (shop_sub_state == 0) {
        ui_selection -= 1;   
    }
    if (shop_sub_state == 1) {
        ui_sub_selection -= 1;
    }
}

if (shop_state == 0) {
    soul_pos_x = 235;
    shopkeeper_xto = 160;
    ui_selection = clamp(ui_selection, 0, 3);
    soul_pos_y = 143 + (ui_selection * 18);
    item_info_y = 182;
    item_info_yto = 182;
    writer_buy.visible = false;
    if (key_accept) {
        switch (ui_selection) {
            case 0:
                delay();
                writer_buy.paused = false;
                writer_buy.reset();
                shop_state = 1;
                ui_selection = 0;
                break;
            case 2:
                delay();
                shop_state = 2;
                writer.reset();
                writer.text = talk_messages[0];
                writer.can_accept = true;
                shopkeeper_object.sprite_index = shopkeeper_talking_sprite
                break;
            case 3:
                delay();
                shop_state = 3;
                item_info_yto = 70;
                writer.reset();
                writer.text = exit_message;
                writer.can_accept = true;
                break;
        }
    }
}

if (shop_state == 1) {
    if (shop_sub_state == 0) {
        soul_pos_y = 139 + (ui_selection * 20);
        soul_pos_x = 22;
        writer_buy.visible = true;
    }
    ui_selection = clamp(ui_selection, 0, 4);
    ui_sub_selection = clamp(ui_sub_selection, 0, 1);
    if (shop_sub_state == 1) {
        writer_buy.visible = false;
        soul_pos_x = 235;
        soul_pos_y = 177 + (ui_sub_selection * 17);
        if (key_accept) {
            switch (ui_sub_selection) {
                case 0:
                    shop_sub_state = 0;
                    writer_buy.text = purchase_message;
                    delay();
                    break;
                case 1:
                    shop_sub_state = 0;
                    writer_buy.text = ignore_message;
                    delay();
                    break;
            }
        }
    }
    shopkeeper_xto = 110;
    if (ui_selection < 4) {
        if (key_accept and !ui_delayed) {
            writer_buy.reset();
            writer_buy.visible = false;
            shop_sub_state = 1;
        }
    }
    if (ui_selection == 4) {
        if (key_accept) {
            shop_state = 0;
            ui_selection = 0;
            writer.reset();
            writer.visible = true;
            writer.text = intermediate_message;
        }
        item_info_yto = 162;
    } else {
        item_info_yto = 72;
    }
}

if (shop_state == 2) {
    
}

if (shop_state == 3) {
    if (writer.page == 1) {
        scr_room_goto_fade(global.prev_room, 0.05);
    }
}