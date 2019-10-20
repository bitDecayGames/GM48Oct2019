/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,oFroge) && !doneAnimating) image_speed = 5;

if (!doneAnimating && image_index == 10) 
{
	image_speed = 0;
	doneAnimating = true;
	//image_index = 0;
}