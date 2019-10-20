var ropeId = instance_create_layer(x, y, "Rope", oRopeEnd);
global.currentRopeId = ropeId

var pId = playerId
with (ropeId) {
	originX = pId.x;
	originY = pId.y;
	player = pId;
	event_user(0);
}