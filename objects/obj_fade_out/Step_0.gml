/// @description Insert description here
// You can write your code in this editor

if (transitioning) {
	if (opacity < 1){
		opacity += 0.01;
	}
	audio_sound_gain(Falling, 1-opacity, 0);
	if(opacity == 1) {
		room_goto_next();
	}
}