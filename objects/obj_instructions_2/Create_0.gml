/// @description set up items

items = [
	"Don't touch the bad stuff",
	"",
	"Or you will restart at a checkpoint",
];
itemLen = array_length_1d(items)

itemHeight = 40;

halfObjs = 5
objsLen = halfObjs * 2 + 1;

objsSpacing = 128;
textSpacing = 200;
lavaSpacing = 180;

var k = -halfObjs;
for (var i = 0; i < objsLen; i++) {
	var _x = x + k * objsSpacing;
	var _y = y + textSpacing;
	instance_create_depth(_x, _y, 2, obj_instructions_lava);
	instance_create_depth(_x, _y + lavaSpacing, 1, obj_instructions_brick);
	k++;
}
