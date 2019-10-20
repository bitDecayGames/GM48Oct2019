/// @description Insert description here
// You can write your code in this editor

//sounds_loaded = false;
//playing_looped_theme = false;
//audio_group_load(audiogroup_default)

if(!audio_is_playing(TheClimbIntro) && !audio_is_playing(TheClimbLoop)){
	audio_play_sound(TheClimbIntro, 100, false);
}

playing_looped_theme = false;
if(audio_is_playing(TheClimbLoop)) {
	playing_looped_theme = true;
}

sounds_loaded = true;