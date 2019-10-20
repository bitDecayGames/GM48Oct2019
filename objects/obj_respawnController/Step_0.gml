/// @description kill the player with R
var _killPlayerCode = keyboard_check_pressed(ord("R"));

if(_killPlayerCode) {	
	instance_destroy(instance_find(oFroge, 0));
}
