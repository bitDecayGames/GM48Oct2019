/// @description create menu

// initialize the game
initialize();

if (!audio_is_playing(Falling)) {
	audio_play_sound(Falling, 100, true);
}


items = [
	"Start",
	"Credits",
	"Quit",
];
itemLen = array_length_1d(items)

ignoreInput = false;


itemOffset = 220;
itemHeight = 130;

selected = 0;

objs = [];

changed = true;

for (var i = 0; i < itemLen; ++i) {
	var obj = instance_create_depth(x, y + itemOffset + i * itemHeight, 0, obj_button);
	objs[i] = obj;
}

post_event("main_menu", -1, -1);