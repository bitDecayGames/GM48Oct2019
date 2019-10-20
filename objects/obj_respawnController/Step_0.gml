/// @description kill the player with R
var _killPlayerCode = keyboard_check_pressed(ord("R"));

if(_killPlayerCode) {	
	play_sfx_die();
	instance_destroy(instance_find(oPlayer, 0));
}
