/// @description handle input

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	play_sfx_menu_select();
	room_goto_next();
}
