/// @description snap to crumbler, start victory pose


playerId.x = frogeTarget_x
playerId.y = frogeTarget_y

playerId.sprite_index = spr_froge_victory_pose;
playerId.image_index = 0;
playerId.image_speed = 7;

crumblerId.image_speed = 5;

alarm[4] = timerToTakePose;