var wallFix = physics_fixture_create();
physics_fixture_set_box_shape(wallFix, other.sprite_width / 2, other.sprite_height / 2);
physics_fixture_bind(wallFix, other.id);

var connectingFix = physics_fixture_create();
physics_fixture_bind(connectingFix, ropeEndFix);
physics_fixture_bind(connectingFix, wallFix);
physics_joint_distance_create(id, other.id, x, y, other.x, other.y, false);

physics_fixture_delete(connectingFix)

physics_fixture_delete(wallFix)

anchored = true;