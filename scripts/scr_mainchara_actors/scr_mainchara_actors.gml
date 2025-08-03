function scr_mainchara_actors(){
    var mc_actor = instance_create_depth(obj_mainchara.x, obj_mainchara.y, -99999, obj_actor);
    mc_actor.sprite_index = obj_mainchara.sprite_index;
    mc_actor.char_name = "mc";
    array_push(obj_cutscene.actors, mc_actor);
    obj_mainchara.visible = false;
    global.can_move = false;
}