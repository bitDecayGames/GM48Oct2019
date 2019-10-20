var ropeDistance = point_distance(other.x, other.y, playerId.x, playerId.y)

var wallFix = physics_fixture_create();
physics_fixture_set_box_shape(wallFix, other.sprite_width / 2, other.sprite_height / 2);
physics_fixture_bind(wallFix, other);

var newSegmentX = (other.x + playerId.x) / 2;
var newSegmentY = (other.y + playerId.y) / 2;
playerId.rope = instance_create_layer(newSegmentX, newSegmentY, "Rope", oRope)
var ropeFix = physics_fixture_create();
physics_fixture_set_box_shape(ropeFix, playerId.rope.sprite_width / 4, playerId.rope.sprite_width / 4)
physics_fixture_bind(ropeFix, playerId.rope)

var playerFix = physics_fixture_create();
physics_fixture_set_box_shape(playerFix, playerId.sprite_width / 2, playerId.sprite_height / 2);
physics_fixture_bind(playerFix, playerId)

var ropeWallConnectingFix = physics_fixture_create();
physics_fixture_bind(ropeWallConnectingFix, wallFix);
physics_fixture_bind(ropeWallConnectingFix, ropeFix);
var ropeWallId = physics_joint_distance_create(other, playerId.rope, other.x, other.y, playerId.rope.x, playerId.rope.y, true);
playerId.ropeWallId = ropeWallId

var playerRopeConnectingFix = physics_fixture_create();
physics_fixture_bind(playerRopeConnectingFix, ropeFix);
physics_fixture_bind(playerRopeConnectingFix, playerFix);
var playerRopeId = physics_joint_rope_create(playerId.rope, playerId, playerId.rope.x, playerId.rope.y, playerId.x, playerId.y, ropeDistance, true);
playerId.playerRopeId = playerRopeId

physics_fixture_delete(wallFix)
physics_fixture_delete(ropeFix)
physics_fixture_delete(playerFix)
physics_fixture_delete(ropeWallConnectingFix)
physics_fixture_delete(playerRopeConnectingFix)

instance_destroy()