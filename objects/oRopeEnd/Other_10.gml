//@Hax hack

var vx = player.x - x;
var vy = player.y - y;
var len = sqrt(vx * vx + vy * vy);
vx = vx / len;
vy = vy / len;

var newSegmentX = x + vx * ropeDistCreateSegment;
var newSegmentY = y + vy * ropeDistCreateSegment;

var newRopeSegment = instance_create_layer(newSegmentX, newSegmentY, "Rope", oRope);
var newRopeSegmentFix = physics_fixture_create();
physics_fixture_set_box_shape(newRopeSegmentFix, newRopeSegment.sprite_width / 4, newRopeSegment.sprite_height / 4);
physics_fixture_bind(newRopeSegmentFix, newRopeSegment.id);	

var connectingFix = physics_fixture_create();
physics_fixture_bind(connectingFix, ropeEndFix);
physics_fixture_bind(connectingFix, newRopeSegmentFix);
physics_joint_distance_create(newRopeSegment, id, newRopeSegment.x, newRopeSegment.y, x, y, false);

ds_stack_push(stackRopeSegmentObj, newRopeSegment);
ds_stack_push(stackRopeSegmentFix, newRopeSegmentFix);

physics_fixture_delete(ropeEndFix);
physics_fixture_delete(newRopeSegmentFix);
physics_fixture_delete(connectingFix);