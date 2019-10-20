/// @description Insert description here
// You can write your code in this editor
var _keyRespawn = keyboard_check(ord("X"));

if(_keyRespawn)
{	
	instance_destroy(global.playerId);
	global.playerId = instance_create_layer(global.elevatorCheckpointId.x + global.elevatorCheckpointId.sprite_width /2,global.elevatorCheckpointId.y  + global.elevatorCheckpointId.sprite_height /2,"Instances",oFroge);
	
}
