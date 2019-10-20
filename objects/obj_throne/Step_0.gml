/// @description move froge and crown

if (isCrownMoving) {
	crownId.y += crownFallSpeed;	
}

if (isFrogeMoving) {
	playerId.x = frogeMoveSpeed;
}

if (isFrogeFalling) {
	playerId.image_angle += 30;	
}