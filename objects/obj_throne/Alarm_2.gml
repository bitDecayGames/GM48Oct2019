/// @description get off throne and walk to crumbler

crumblerId = instance_find(obj_crumble_tile, 0);
playerId.sprite_index = spr_froge_walking_crown;
playerId.image_index = 0;
playerId.image_speed = 0.75;
playerId.image_xscale = -1;
isFrogeMoving = true;
frogeTarget_x = crumblerId.x + crumblerId.sprite_width / 2.0;
frogeTarget_y = y + playerId.sprite_height / 4.0;
frogeOriginal_x = playerId.x;
frogeOriginal_y = playerId.y + playerId.sprite_height / 4.0;

currentAlarmTimerIndex = 3;
currentAlarmTimerTotal = timerToMoveFrogToCrumbler;
alarm[3] = timerToMoveFrogToCrumbler;
