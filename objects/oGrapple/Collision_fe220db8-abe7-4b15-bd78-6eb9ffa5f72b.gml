var ropeDistance = point_distance(other.x, other.y, playerId.x, playerId.y)
var numSegments = ropeDistance / ropeDistCreateSegment

var lastRopeSegment = other;

var ropeDis = 4

for (var i = 0; i < numSegments; ++i)
{
	var lastRopeSegmentFix = physics_fixture_create();
	physics_fixture_set_box_shape(lastRopeSegmentFix, lastRopeSegment.sprite_width / 4, lastRopeSegment.sprite_height / 4);
	physics_fixture_bind(lastRopeSegmentFix, lastRopeSegment);
	
	var vx = playerId.x - lastRopeSegment.x
	var vy = playerId.y - lastRopeSegment.y
	var len = sqrt(vx * vx + vy * vy)
	vx = vx / len
	vy = vy / len
	var newSegmentX = lastRopeSegment.x + vx * ropeDistCreateSegment
	var newSegmentY = lastRopeSegment.y + vy * ropeDistCreateSegment

	var nextRopeSegment = instance_create_layer(newSegmentX, newSegmentY, "Rope", oRope)
	var nextRopeSegmentFix = physics_fixture_create();
	physics_fixture_set_box_shape(nextRopeSegmentFix, nextRopeSegment.sprite_width / 4, nextRopeSegment.sprite_width / 4)
	physics_fixture_bind(nextRopeSegmentFix, nextRopeSegment)
	
	playerId.stackRopeSegmentObj[i] = nextRopeSegment

	var ropeConnectingFix = physics_fixture_create();
	physics_fixture_bind(ropeConnectingFix, lastRopeSegmentFix);
	physics_fixture_bind(ropeConnectingFix, nextRopeSegmentFix);
	var ropeConnectingId = physics_joint_rope_create(lastRopeSegment, nextRopeSegment, lastRopeSegment.x, lastRopeSegment.y, nextRopeSegment.x, nextRopeSegment.y, ropeDis, true);
	
	ds_stack_push(playerId.stackRopeJoints, ropeConnectingId)

	physics_fixture_delete(lastRopeSegmentFix)
	physics_fixture_delete(nextRopeSegmentFix)
	physics_fixture_delete(ropeConnectingFix)
	
	lastRopeSegment = nextRopeSegment
}

var playerFix = physics_fixture_create();
physics_fixture_set_circle_shape(playerFix, playerId.sprite_width / 2);
physics_fixture_bind(playerFix, playerId)

var lastRopeSegmentFix = physics_fixture_create();
physics_fixture_set_box_shape(lastRopeSegmentFix, lastRopeSegment.sprite_width / 4, lastRopeSegment.sprite_height / 4);
physics_fixture_bind(lastRopeSegmentFix, lastRopeSegment);
	
var playerRopeConnectingFix = physics_fixture_create();
physics_fixture_bind(playerRopeConnectingFix, playerFix);
physics_fixture_bind(playerRopeConnectingFix, lastRopeSegmentFix);
var playerRopeConnectingId = physics_joint_rope_create(lastRopeSegment, playerId, lastRopeSegment.x, lastRopeSegment.y, playerId.x, playerId.y, ropeDis, true);

ds_stack_push(playerId.stackRopeJoints, playerRopeConnectingId)

physics_fixture_delete(lastRopeSegmentFix)
physics_fixture_delete(nextRopeSegmentFix)
physics_fixture_delete(ropeConnectingFix)

//player animation logic
playerId.image_speed = 1;
playerId.sprite_index = spr_start_swing_frog;
play_sfx_grapple_connect();

instance_destroy()

//var ropeDistance = point_distance(other.x, other.y, playerId.x, playerId.y)

//var wallFix = physics_fixture_create();
//physics_fixture_set_box_shape(wallFix, other.sprite_width / 2, other.sprite_height / 2);
//physics_fixture_bind(wallFix, other);

//var newSegmentX = (other.x + playerId.x) / 2;
//var newSegmentY = (other.y + playerId.y) / 2;
//playerId.rope = instance_create_layer(newSegmentX, newSegmentY, "Rope", oRope)
//var ropeFix = physics_fixture_create();
//physics_fixture_set_box_shape(ropeFix, playerId.rope.sprite_width / 4, playerId.rope.sprite_width / 4)
//physics_fixture_bind(ropeFix, playerId.rope)

//var playerFix = physics_fixture_create();
//physics_fixture_set_box_shape(playerFix, playerId.sprite_width / 2, playerId.sprite_height / 2);
//physics_fixture_bind(playerFix, playerId)

//var ropeWallConnectingFix = physics_fixture_create();
//physics_fixture_bind(ropeWallConnectingFix, wallFix);
//physics_fixture_bind(ropeWallConnectingFix, ropeFix);
//var ropeWallId = physics_joint_distance_create(other, playerId.rope, other.x, other.y, playerId.rope.x, playerId.rope.y, true);
//playerId.ropeWallId = ropeWallId

//var playerRopeConnectingFix = physics_fixture_create();
//physics_fixture_bind(playerRopeConnectingFix, ropeFix);
//physics_fixture_bind(playerRopeConnectingFix, playerFix);
//var playerRopeId = physics_joint_rope_create(playerId.rope, playerId, playerId.rope.x, playerId.rope.y, playerId.x, playerId.y, ropeDistance, true);
//playerId.playerRopeId = playerRopeId

//physics_fixture_delete(wallFix)
//physics_fixture_delete(ropeFix)
//physics_fixture_delete(playerFix)
//physics_fixture_delete(ropeWallConnectingFix)
//physics_fixture_delete(playerRopeConnectingFix)

//instance_destroy()
