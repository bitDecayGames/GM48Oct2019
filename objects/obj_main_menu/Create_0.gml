/// @description create menu

// initialize the game
initialize();

items = [
	"Start",
	"Credits",
	"Quit",
];
itemLen = array_length_1d(items)

itemHeight = 150;

selected = 0;

objs = [];

changed = true;

for (var i = 0; i < itemLen; ++i) {
	var obj = instance_create_depth(x, y + i * itemHeight, 0, obj_button);
	objs[i] = obj;
}

post_event("main_menu", -1, -1);