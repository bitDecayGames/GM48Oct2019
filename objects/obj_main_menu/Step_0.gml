/// @description handle input

if (!ignoreInput && (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))) {
	play_sfx_menu_move();
	selected -= 1;
	changed = true;
} else if (!ignoreInput && (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))) {
	play_sfx_menu_move();
	selected += 1;
	changed = true;
}

if (selected >= itemLen) selected = 0;
if (selected < 0) selected = itemLen - 1;

if (changed) {
	for (var i = 0; i < itemLen; i++) {
		if (i == selected) objs[i].image_index = 1;	
		else objs[i].image_index = 0;
	}
	changed = false;
}

if (!ignoreInput && (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))) {
	alarm[0] = 45;
	ignoreInput = true;
	
	var frog = instance_find(obj_spinning_frog, 0);
	frog.isFalling = true;
	play_sfx_menu_select();
}

