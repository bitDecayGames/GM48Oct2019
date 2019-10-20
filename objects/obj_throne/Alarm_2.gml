/// @description get off throne and walk to crumbler

crumblerId = instance_find(obj_crumble_tile, 0);
playerId.sprite_index = spr_froge_walking_crown;
playerId.image_index = 0;
playerId.image_speed = 7;
playerId.image_xscale = -1;
isFrogeMoving = true;
frogeTarget_x = crumblerId.x;
frogeTarget_y = y;
alarm[3] = timerToMoveFrogToCrumbler;
