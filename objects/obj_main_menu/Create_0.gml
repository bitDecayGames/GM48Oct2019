/// @description create menu

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
    var item = items[i];
	var obj = instance_create_depth(x, y + i * itemHeight, 0, obj_button);
	objs[i] = obj;
}

