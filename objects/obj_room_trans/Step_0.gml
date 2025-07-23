if (instance_exists(obj_fade_transition) and obj_fade_transition.fade_state == "fade_in" and instance_exists(obj_mainchara)) {
    switch (type) {
        case "a":
            obj_mainchara.x = obj_markerA.x;
            obj_mainchara.y = obj_markerA.y;
            break;
        case "b":
            obj_mainchara.x = obj_markerB.x;
            obj_mainchara.y = obj_markerB.y;
            break;
        case "c":
            obj_mainchara.x = obj_markerC.x;
            obj_mainchara.y = obj_markerC.y;
            break;
        case "d":
            obj_mainchara.x = obj_markerD.x;
            obj_mainchara.y = obj_markerD.y;
            break;
    }
    global.can_move = true;
    instance_destroy();
}