var ropeId = instance_create_layer(x, y, "Rope", oRopeEnd);
var pId = playerId
var pFix = playerFixture
with (ropeId) {
	originX = pId.x;
	originY = pId.y;
	player = pId;
	playerFix = pFix
	solid = true;
	anchored = true;
	event_user(0);
}