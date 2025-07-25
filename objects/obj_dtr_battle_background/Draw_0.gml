// obj_grid_bg - Draw Event
draw_set_color(c_black);
draw_set_alpha(_bg_alpha);
draw_rectangle(0, 0, room_width, room_height, false);

// === BACKGROUND GRID (Layer 2, slower, half alpha) ===
draw_set_color(c_purple);
draw_set_alpha(_bg_alpha - 0.5);

var _cols = ceil(room_width / _spacing) + 2;
var _rows = ceil(room_height / _spacing) + 2;
var _ox2 = -_offset2 - _spacing;

// Vertical lines (background)
for (var _i = 0; _i < _cols; _i++) {
    var _lx = _ox2 + _i * _spacing;
    draw_line(_lx + 10, 0, _lx + 10, room_height);
}

// Horizontal lines (background)
for (var _j = 0; _j < _rows; _j++) {
    var _ly = _ox2 + _j * _spacing;
    draw_line(0, _ly + 10, room_width, _ly + 10);
}

// === FOREGROUND GRID (Layer 1, normal speed, full alpha) ===
draw_set_alpha(_bg_alpha);
var _ox1 = -_offset1 - _spacing;

// Vertical lines (foreground)
for (var _i = 0; _i < _cols; _i++) {
    var _lx = _ox1 + _i * _spacing;
    draw_line(_lx, 0, _lx, room_height);
}

// Horizontal lines (foreground)
for (var _j = 0; _j < _rows; _j++) {
    var _ly = _ox1 + _j * _spacing;
    draw_line(0, _ly, room_width, _ly);
}

// Reset color and alpha
draw_set_color(c_white);
draw_set_alpha(1);
