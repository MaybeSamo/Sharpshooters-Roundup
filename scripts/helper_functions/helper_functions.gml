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