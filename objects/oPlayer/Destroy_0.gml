/// @description create exploding frog

instance_create_depth(x, y, depth, obj_exploding_frog);

while(ds_stack_size(stackRopeSegmentObj) > 0) instance_destroy(ds_stack_pop(stackRopeSegmentObj))
while(ds_stack_size(stackRopeJoints) > 0) physics_joint_delete(ds_stack_pop(stackRopeJoints))