/// @description handle going back

if (!ignoreInput && keyboard_check_pressed(vk_escape)) {
	play_sfx_menu_back();
	alarm[0] = 45;
	ignoreInput = true;
	
	var frog = instance_find(obj_spinning_frog, 0);
	frog.isFalling = true;
	
		
}
