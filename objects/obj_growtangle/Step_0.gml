if (state == 0) {
    image_xscale += 0.05;
    image_yscale += 0.05;
    image_angle += 10;   
}

if (image_xscale == 1) {
    state = 1;
    image_angle = 0;
}

var _i = instance_create_depth(x, y, depth + 1, obj_growtangle_sillouhete);
_i.image_xscale = image_xscale;
_i.image_yscale = image_yscale;
_i.image_angle = image_angle;
_i.depth = depth - 1;