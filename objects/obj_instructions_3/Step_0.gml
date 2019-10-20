/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	play_sfx_menu_select();
	fade_out_and_go_to_next_scene();
}