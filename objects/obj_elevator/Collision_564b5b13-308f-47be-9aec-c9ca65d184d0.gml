/// @description trigger checkpoint save

if (!doneAnimating){
	
	image_speed = 5;
	play_sfx_bell();
	global.checkpoint_room = room_get_name(room);
	global.checkpoint_index = checkpoint_index;
}