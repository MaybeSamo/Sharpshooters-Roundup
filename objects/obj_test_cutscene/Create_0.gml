cutscene = instance_create_depth(0, 0, 0, obj_cutscene);
cutscene.event_queue = [
c_add_actor(obj_actor, 133, 112, 0, "actor"),
c_sel_actor("actor"),
c_walk(true),
c_dir("l"),
c_wait(30),
c_walk(false),
c_set_global("player_health", 10),
c_msgpush("* Lalalalalalallalalaalalalalalalalalalalaalalalalal"),
c_wait_talk(),
c_destroy_actors(),
c_end_cutscene()
]