/// @description create exploding frog

instance_create_depth(x, y, depth, obj_exploding_frog);

var len = array_length_1d(stackRopeSegmentObj)
for (var i = 0; i < len; i++) {
	instance_destroy(stackRopeSegmentObj[i])		
}
stackRopeSegmentObj = array_create(0)

while(ds_stack_size(stackRopeJoints) > 0) physics_joint_delete(ds_stack_pop(stackRopeJoints))

if grappleId != pointer_null && instance_exists(grappleId) {
	instance_destroy(grappleId)	
}