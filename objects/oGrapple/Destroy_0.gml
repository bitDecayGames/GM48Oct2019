var ropeId = instance_create_layer(x, y, "Rope", oRopeEnd);
global.currentRopeId = ropeId

var pId = playerId
var pFix = playerFixture
with (ropeId) {
	originX = pId.x;
	originY = pId.y;
	player = pId;
	playerFix = pFix
	event_user(0);
}