function scr_remove_item(index){
    for (var i = index; i < array_length(global.items) - 1; i++) {
        global.items[i] = global.items[i + 1];
    }
    
    array_resize(global.items, array_length(global.items) - 1);
}