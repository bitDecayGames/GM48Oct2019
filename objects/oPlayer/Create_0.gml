hSpeed = 0;
vSpeed = 0;
walkSpeed = 3;
walkAcceleration = 1.5;
hFrictionGround = 0.5;
hFrictionAir = 0;
jumpSpeed = 6;
gravity_ = 0.2;
hSpeedFraction = 0.0;
vSpeedFraction = 0.0;
playerState = pState.normal;
ropeState = rState.noRope;
Rope = pointer_null;

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

var Fix = physics_fixture_create();
physics_fixture_set_box_shape(Fix, sprite_width / 4, sprite_height / 4);
physics_fixture_bind(Fix, id);
physics_fixture_delete(Fix);