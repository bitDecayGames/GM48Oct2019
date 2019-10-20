/// @argument0 player object
/// @argument0 is snaping vertical

var player = argument0;
var vertical = argument1;

global.player_x = player.x;
global.player_y = player.y;
global.player_velocity_x = player.phy_linear_velocity_x;
global.player_velocity_y = player.phy_linear_velocity_y;
global.player_vertical = vertical;
global.player_has_snapshot = true;