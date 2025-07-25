// obj_grid_bg - Step Event
var _dt = delta_time / 1000000;

_offset1 = (_offset1 + _speed1 * _dt) mod _spacing;
_offset2 = (_offset2 - _speed2 * _dt) mod _spacing; // Opposite direction
