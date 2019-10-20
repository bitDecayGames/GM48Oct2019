/// @description snap crown to player and wait

instance_destroy(crownId);
isCrownMoving = false;

// switch sprite to crown frog
playerId.image_index = 1;

alarm[2] = timerToSitOnThroneWithCrown;