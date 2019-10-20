
var _x = room_width / 2;
var _y = room_height / 2;
var _buffer = 100;
var _velX = 0;
var _velY = 0;


var _hasSnapshot = variable_global_exists("player_has_snapshot")

if (_hasSnapshot) {
	// TODO: figure out how to set x and y
	if (global.player_vertical) {
		_y = global.player_y;
		if (global.player_velocity_x > 0) {
			_x = global.player_x - room_width + _buffer;
		} else {
			_x = global.player_x + room_width - _buffer;
		}
	} else {
		_x = global.player_x;
		if (global.player_velocity_y > 0) {
			_y = global.player_y - room_height + _buffer;
		} else {
			_y = global.player_y + room_height - _buffer;
		}
	}
}

// TODO: create in layer instead of depth so that collisions happen correctly
// TODO: create the real player object
var player = instance_create_depth(_x, _y, 0, obj_test_player);

if (_hasSnapshot) {
	player.phy_linear_velocity_x = global.player_velocity_x;
	player.phy_linear_velocity_y = global.player_velocity_y;
}