var ropeEndId = instance_create_layer(x, y, "Rope", oRopeEnd);
global.currentRopeId = ropeEndId

var pId = playerId
with (ropeEndId) {
	originX = pId.x;
	originY = pId.y;
	player = pId;
	event_user(0);
}