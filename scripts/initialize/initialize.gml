if (!variable_global_exists("initialized")) {
	randomize();
	global.initialized = true;
	global.game_guid = guid();
	global.checkpoint_index = 0;
	global.checkpoint_room = "rm_0";
	global.should_spawn_player = true;
}