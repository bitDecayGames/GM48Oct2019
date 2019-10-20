global.playerId = id;
acceleration = 1
grappleAcceleration = 20


debug_impulse_start_x = 0
debug_impulse_start_y = 0
debug_impulse_end_x = 0
debug_impulse_end_y = 0

var frogeFix = physics_fixture_create();
physics_fixture_set_box_shape(frogeFix, sprite_width / 2, sprite_height / 2)

physics_fixture_bind(frogeFix, id);

var tileId = instance_create_layer(x + 100, y + 100, "Instances", oTile)
var tileFix = physics_fixture_create();
physics_fixture_set_box_shape(tileFix, 16, 16)

with(tileId) {
	physics_fixture_bind(tileFix, id);
}

var ropeFixture = physics_fixture_create();
physics_fixture_bind(ropeFixture, frogeFix);
physics_fixture_bind(ropeFixture, tileFix);
physics_joint_rope_create(id, tileId, x, y, tileId.x, tileId.y, 150, true);

physics_fixture_delete(ropeFixture);
physics_fixture_delete(frogeFix);
physics_fixture_delete(tileFix);

/*
state = pState.normal;

enum pState
{
	normal,
	swing
}
*/