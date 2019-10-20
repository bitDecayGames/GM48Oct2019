/// @description Insert description here
// You can write your code in this editor

while (!ds_stack_empty(stackRopeSegmentObj)) instance_destroy(ds_stack_pop(stackRopeSegmentObj));
ds_stack_destroy(stackRopeSegmentObj);

while (!ds_stack_empty(stackRopeSegmentFix)) instance_destroy(ds_stack_pop(stackRopeSegmentFix));
ds_stack_destroy(stackRopeSegmentFix);