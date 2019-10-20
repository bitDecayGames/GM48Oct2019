/// @description setup variables

playerId = pointer_null;
crumbleId = pointer_null;
crownId = pointer_null;

crownStartY = -400;
isCrownMoving = false;
crownOriginal_x = 0;
crownOriginal_y = 0;

frogeOriginal_x = 0;
frogeOriginal_y = 0;
frogeTarget_x = -1;
frogeTarget_y = -1;
isFrogeMoving = false;
isFrogeFalling = false;
currentAlarmTimerIndex = 0;
currentAlarmTimerTotal = 0.0;


timerToMoveFrogToThrone = 50.0;
timerToDropCrown = 500.0;
timerToSitOnThroneWithCrown = 100.0;
timerToMoveFrogToCrumbler = 300.0;
timerToTakePose = 300.0;
timerToSpin = 100.0;
timerToFallAndExitLevel = 100.0;