/// @description start cutscene

playerId = other;
// set global boolean that you've completed the game
global.completed_game = true;
// TODO: take control away from the player
// move player to specific point
isFrogeMoving = true;
frogeTarget_x = x;
frogeTarget_y = y;

playerId.sprite_index = spr_froge_walking;
playerId.image_index = -1;
playerId.image_speed = 7;
playerId.image_xscale = -1;
playerId.phy_active = false;

alarm[0] = timerToMoveFrogToThrone;