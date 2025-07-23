var _fullscreen = window_get_fullscreen();

if (_fullscreen) {
    window_set_fullscreen(false);
} else {
    window_set_fullscreen(true);
}