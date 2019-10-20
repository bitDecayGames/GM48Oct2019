var lay_id = layer_get_id("Tiles")
var tilemap_id = layer_tilemap_get_id(lay_id)

var tile_width = tilemap_get_tile_width(tilemap_id)
var tile_height = tilemap_get_tile_width(tilemap_id)

for (var p_x = tile_width / 2; p_x < room_width; p_x += tile_width)
{
	for (var p_y = tile_height / 2; p_y < room_height; p_y += tile_height)
	{	
		var c_x = tilemap_get_cell_x_at_pixel(tilemap_id, p_x, p_y);
		var c_y = tilemap_get_cell_y_at_pixel(tilemap_id, p_x, p_y);
		var data = tilemap_get(tilemap_id, c_x, c_y);
		var tile_idx = tile_get_index(data);
		if tile_idx < 1 {
			continue	
		}

		with(instance_create_layer(p_x, p_y, "Instances", oTile)) {
			var fix = physics_fixture_create();
			physics_fixture_set_box_shape(fix, tile_width / 2, tile_height / 2)

			physics_fixture_bind(fix, id);
			physics_fixture_delete(fix);
		}
	}
}