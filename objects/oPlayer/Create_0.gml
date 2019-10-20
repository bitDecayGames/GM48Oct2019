//hSpeed = 0;
//vSpeed = 0;
//walkSpeed = 3;
//walkAcceleration = 1.5;
//hFrictionGround = 0.5;
//hFrictionAir = 0;
//jumpSpeed = 6;
//gravity_ = 0.2;
//hSpeedFraction = 0.0;
//vSpeedFraction = 0.0;
//playerState = pState.normal;
//ropeState = rState.noRope;
//rope = pointer_null;
grappleId = pointer_null;
stackRopeSegmentObj = array_create(0)
stackRopeJoints = ds_stack_create();

global.currentRopeId = pointer_null
acceleration = 15
grappleAcceleration = 50

enum pState
{
	normal,
	swing,
	endSwing
}

enum rState
{
	noRope,
	throwing,
	stuck
}
