rand = random_range(0, 2);
show_debug_message(rand);
if (rand < 1) {
	audio_play_sound(die2, 0, false);	
} else if (rand < 2) {
	audio_play_sound(die2, 0, false);	
}