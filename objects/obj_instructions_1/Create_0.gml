/// @description set up items

items = [
	"You can aim with your mouse",
	"[Hold Left Click] to Shoot your Hook",
	"[A/D] to Move while Grappled",
];
itemLen = array_length_1d(items)

itemHeight = 40;

post_event("instructions", -1, -1);