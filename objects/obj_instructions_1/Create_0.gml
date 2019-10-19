/// @description set up items

items = [
	"Use the Grappling Hook to move",
	"[Left Click] / [A]",
	"You can aim with your mouse",
];
itemLen = array_length_1d(items)

itemHeight = 40;

post_event("instructions", -1, -1);