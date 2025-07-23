on_interact = function() {
    audio_play_sound(snd_test, 0, false);
    var _i = instance_create_depth(x, y, -99999, obj_dmgwriter);
    _i.damage = round(random_range(1, 100));
}