if (state == 0) {
    image_alpha += 0.20;
    if (image_alpha >= 1) {
        state = 1;    
    }   
}
if (state == 1) {
    image_alpha -= 0.20;
    if (image_alpha <= 0) {
        instance_destroy();
    }
}