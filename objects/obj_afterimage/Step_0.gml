if (image_alpha <= 0) {
    instance_destroy();
}

if (image_xscale < 0) {
    instance_destroy();
}

image_alpha -= fade_speed;
image_xscale += scale_speed;