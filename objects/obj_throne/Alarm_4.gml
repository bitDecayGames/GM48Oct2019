/// @description crumble and start spinning

playerId.sprite_index = spr_spinning_froge_crown;
playerId.image_index = 0;
playerId.image_speed = 0;

isFrogeFalling = true;

crumblerId.sprite_index = spr_full_crumble;
crumblerId.image_speed = 2;
crumblerId.killAfterAnimationEnd = true;

alarm[5] = timerToSpin;