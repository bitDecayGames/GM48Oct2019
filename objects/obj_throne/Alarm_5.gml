/// @description start falling

frogeTarget_x = playerId.x;
frogeTarget_y = playerId.y + 200;
frogeOriginal_x = playerId.x;
frogeOriginal_y = playerId.y;
isFrogeMoving = true;

currentAlarmTimerIndex = 6;
currentAlarmTimerTotal = timerToFallAndExitLevel;
alarm[6] = timerToFallAndExitLevel;