//Shorter version of instance_create
function i_create(x, y, inst){
    return instance_create_depth(x, y, 0, inst)
}

function camerax() {
    return camera_get_view_x(view_camera[0]);
}

function cameray() {
    return camera_get_view_y(view_camera[0]);
}

function i_ex(inst) {
    return instance_exists(inst);
}

function draw_rectangle_thick(x1, y1, x2, y2, thickness, col) {
    draw_set_color(col);
    
    // Top side
    draw_line_width(x1, y1, x2, y1, thickness);
    // Right side
    draw_line_width(x2, y1, x2, y2, thickness);
    // Bottom side
    draw_line_width(x2, y2, x1, y2, thickness);
    // Left side
    draw_line_width(x1, y2, x1, y1, thickness);
}

function draw_sprite_halfsize(sprite_index, sub_img, x, y) {
    draw_sprite_ext(sprite_index, sub_img, x, y, 0.5, 0.5, 0, c_white, 1);
}