/// @description set up items

items = [
	"PROGRAMMING",
	"Jake 'Always on Time' Caban-Tomski",
	"Luke 'King' Fisher",
	"Jake 'Not That Jake' Fisher",
	"Logan 'Joker and Thief' Moore",
	"Mike 'Big Daddy' Wingfield",
	"",
	"ART",
	"Logan 'Ice Ice Baby' Moore",
	"Mike 'Peter Pixel Piper' Wingfield",
	"",
	"Music composition/SFX",
	"Tanner 'Smooth Jazz' Moore",
	"",
	"",
	"Thanks for playing our game.",
	"[escape to go back]",
];
itemLen = array_length_1d(items)

itemHeight = 35;

ignoreInput = false;


post_event("view_credits", -1, -1);