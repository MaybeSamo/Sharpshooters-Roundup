if (instance_exists(obj_mainchara) and global.camera_following) {
    cam_x = obj_mainchara.x - camera_get_view_width(view_camera[0]) / 2;
    cam_y = obj_mainchara.y - camera_get_view_height(view_camera[0]) / 2;   
    cam_x = clamp(cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
    cam_y = clamp(cam_y, 0, room_height - camera_get_view_height(view_camera[0]));
}

if (!global.camera_following) {
    cam_x += h_speed;
    cam_y += v_speed;
}

if (shake_timer > 0) {
    shake_timer--;
    
    var shake_x = random_range(-shake_magnitude, shake_magnitude);
    var shake_y = random_range(-shake_magnitude, shake_magnitude);
    
    cam_x += shake_x;
    cam_y += shake_y;
}

camera_set_view_pos(view_camera[0], cam_x, cam_y);