/// @description trigger checkpoint save

if(!sound_played){
	play_sfx_bell();
	sound_played = true;	
}

if (!doneAnimating){
	image_speed = 5;
	global.checkpoint_room = room_get_name(room);
	global.checkpoint_index = checkpoint_index;
}