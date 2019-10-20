initialize(); // just in case you are starting from a test level instead of coming from main_menu

// if player is dead, they will now spawn
if (global.should_spawn_player){
	if (room_get_name(room) != global.checkpoint_room){
		room_goto(asset_get_index(global.checkpoint_room));
	} else {
		var checkpointCount = instance_number(obj_elevator);
		for(var i=0; i < checkpointCount; i++) {
		    var inst = instance_find(obj_elevator, i);
		    if (inst.checkpoint_index == global.checkpoint_index) {
				global.should_spawn_player = false;
				var player = instance_create_layer(inst.x + inst.sprite_width /2, inst.y  + inst.sprite_height /2,"Instances",oPlayer);
				player.depth = -10;
				i = checkpointCount;
				break;
			}
		}
	}
} else {
	// if the player is switching rooms, but not dying, they will now spawn at the correct x,y
	create_player_from_snapshot();
}