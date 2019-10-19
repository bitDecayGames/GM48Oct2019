/// @argument0 name
/// @argument1 x
/// @argument2 y

var prod = true; // set prod to true if you want to capture data
var name = argument0;
var _x = argument1;
var _y = argument2;

if (prod){
	var map = ds_map_create();
	var data="{\"game_guid\":\"" + global.game_guid + "\",\"name\": \"" + string(name) + "\", \"date\": \"" + string(timestamp()) + "\", \"x\":" + string(_x) + ", \"y\":" + string(_y) + "}";
	var url = "https://gm4832bitdecaygames-149ce.firebaseio.com/event.json?auth=dnWdIrcc7Sd6Fi5OpG7oRKvKaF2MGahrWVZHk3nZ";
	request = http_request(url, "POST", map, data);
}