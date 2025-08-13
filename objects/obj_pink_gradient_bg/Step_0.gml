// Time tracker (could also use current_time / 1000 for real-time based)
var t = current_time / 1000; // or use an incrementing variable like `time += 0.05`

var scale = 1.8 + sin(t) * 0.8;

image_yscale = scale;

if (flash) {
    flash_alpha -= 0.1;
}