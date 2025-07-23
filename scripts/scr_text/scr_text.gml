function scr_text(text){
    if (room != room_battle) {
        array_push(global.msg, text);
    } else if (room == room_battle) {
        obj_writer.typing = true;
        obj_writer.draw_char = 0;
        obj_writer.text = text;
    }
}