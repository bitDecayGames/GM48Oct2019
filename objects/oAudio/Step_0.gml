/// @description Insert description here
// You can write your code in this editor

debug_sound_controls = false;

if (sounds_loaded){	
	if (!audio_is_playing(TheClimbIntro) && !playing_looped_theme) {
		playing_looped_theme = true;
		audio_play_sound(TheClimbLoop, 100, true);
	}
	
	if(debug_sound_controls){
		if (keyboard_check_pressed(vk_left)){
			play_sfx_die();
		}
	
		if (keyboard_check_pressed(vk_up)){
			play_sfx_grapple();
		}
	
		if (keyboard_check_pressed(vk_right)){
			play_sfx_jump();
		}
	
		if (keyboard_check_pressed(vk_down)){
			play_sfx_lava();
		}
	
		if (keyboard_check_pressed(ord("A"))){
			play_sfx_lick();
		}
	
		if (keyboard_check_pressed(ord("S"))){
			play_sfx_throw();
		}
	
		if (keyboard_check_pressed(ord("D"))){
			play_sfx_tongue_contact();
		}
	}
}