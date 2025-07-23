if (exiting) {
    image_alpha -= 0.065;
    image_xscale -= 0.055;
}

if (image_alpha <= 0) {
    instance_destroy();
}