/// @description snap froge to throne and then start crown drop animation

playerId.x = x;
playerId.y = y;

playerId.sprite_index = spr_sitting_froge;

playerId.image_index = 0;
playerId.image_speed = 0;
playerId.image_xscale = 1;
isFrogeMoving = false;

// drop crown onto frog
crownId = instance_create_depth(x, y + crownStartY, depth - 1, obj_crown);
isCrownMoving = true;

crownOriginal_x = crownId.x;
crownOriginal_y = crownId.y;
currentAlarmTimerIndex = 1;
currentAlarmTimerTotal = timerToDropCrown;
alarm[1] = timerToDropCrown;