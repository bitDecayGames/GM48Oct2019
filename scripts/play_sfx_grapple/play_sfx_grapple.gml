rand = random_range(0, 3);
show_debug_message(rand);
if (rand < 1) {
	audio_play_sound(grapple1, 0, false);	
} else if (rand < 2) {
	audio_play_sound(grapple2, 0, false);	
} else if (rand < 3) {
	audio_play_sound(grapple3, 0, false);	
}