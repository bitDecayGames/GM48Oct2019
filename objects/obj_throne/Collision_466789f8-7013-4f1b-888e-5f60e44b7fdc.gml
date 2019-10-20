/// @description start cutscene

audio_stop_all();
audio_play_sound(Throne, 0, false);

playerId = instance_create_depth(other.x, other.y, depth - 1, obj_scene_player);
other.phy_active = false;
other.enable_player_input = false;
other.visible = false;

// set global boolean that you've completed the game
global.completed_game = true;
// move player to specific point
isFrogeMoving = true;
frogeTarget_x = x;
frogeTarget_y = y;
frogeOriginal_x = playerId.x;
frogeOriginal_y = playerId.y;

playerId.sprite_index = spr_froge_walking;
playerId.image_index = -1;
playerId.image_speed = 1;
playerId.image_xscale = -1;


currentAlarmTimerIndex = 0;
currentAlarmTimerTotal = timerToMoveFrogToThrone;
alarm[0] = timerToMoveFrogToThrone;