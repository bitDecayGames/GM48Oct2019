/// @description move froge and crown

if (isCrownMoving) {
	var ratio = alarm[currentAlarmTimerIndex] / currentAlarmTimerTotal;
	if (ratio <= 0) {
		crownId.x = x;
		crownId.y = y;
	} else {
		crownId.x = (crownOriginal_x - x) * ratio + x;
		crownId.y = (crownOriginal_y - y) * ratio + y;
	}
}

if (isFrogeMoving) {
	var ratio = alarm[currentAlarmTimerIndex] / currentAlarmTimerTotal;
	if (ratio <= 0) {
		playerId.x = frogeTarget_x;
		playerId.y = frogeTarget_y;
	} else {
		playerId.x = (frogeOriginal_x - frogeTarget_x) * ratio + frogeTarget_x;
		playerId.y = (frogeOriginal_y - frogeTarget_y) * ratio + frogeTarget_y;
	}
}

if (isFrogeFalling) {
	playerId.image_angle += 5;	
}