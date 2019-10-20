/// @description check if player collided, then save checkpoint
if ((place_meeting(x,y,oFroge) || place_meeting(x,y,oPlayer)) && !doneAnimating) 
{
	image_speed = 5;
	global.checkpoint_room = room_get_name(room);
	global.checkpoint_index = checkpoint_index;
}

if (!doneAnimating && image_index == 10) 
{
	image_speed = 0;
	doneAnimating = true;
	//image_index = 0;
}