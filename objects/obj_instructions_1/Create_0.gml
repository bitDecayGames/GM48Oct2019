/// @description set up items

items = [
	"[W/A/S/D] to Move",
	"[Hold Left Click] to Shoot your Hook",
	"You can aim with your mouse",
];
itemLen = array_length_1d(items)

itemHeight = 40;

post_event("instructions", -1, -1);