var ropeDistance = point_distance(other.x, other.y, playerId.x, playerId.y)

var wallFix = physics_fixture_create();
physics_fixture_set_box_shape(wallFix, other.sprite_width / 2, other.sprite_height / 2);
physics_fixture_bind(wallFix, other.id);

var playerFix = physics_fixture_create();
physics_fixture_set_box_shape(playerFix, playerId.sprite_width / 2, playerId.sprite_height / 2);
physics_fixture_bind(playerFix, playerId)

var playerConnectingFix = physics_fixture_create();
physics_fixture_bind(playerConnectingFix, wallFix);
physics_fixture_bind(playerConnectingFix, playerFix);
var ropeJointId = physics_joint_rope_create(other, playerId, other.x, other.y, playerId.x, playerId.y, ropeDistance, false);
playerId.ropeJointId = ropeJointId

physics_fixture_delete(wallFix)
physics_fixture_delete(playerFix)
physics_fixture_delete(playerConnectingFix)	

instance_destroy()