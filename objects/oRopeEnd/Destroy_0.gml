/// @description Insert description here
// You can write your code in this editor

while (!ds_stack_empty(stackRopeSegmentObj)) instance_destroy(ds_stack_pop(stackRopeSegmentObj));
ds_stack_destroy(stackRopeSegmentObj);

while (!ds_stack_empty(stackRopeSegmentFix)) physics_fixture_delete(ds_stack_pop(stackRopeSegmentFix));
ds_stack_destroy(stackRopeSegmentFix);

physics_fixture_delete(ropeEndFix)