if (!variable_global_exists("initialized")) {
	randomize();
	global.initialized = true;
	global.game_guid = guid()
	global.last_checkpoint = 0;
}