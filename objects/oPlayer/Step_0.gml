grounded = (place_meeting(x, y+1, oWall));

var _keyLeft = keyboard_check(ord("A"));
var _keyRight = keyboard_check(ord("D"));
var _keyUp = keyboard_check(ord("W"));
var _keyDown = keyboard_check(ord("S"));
var _keyJump = keyboard_check(vk_space);

var aX = 0
if _keyLeft {
	aX -= acceleration	
} else if _keyRight {
	aX += acceleration
}
physics_apply_impulse(x, y, aX, 0);

var _fireGrapplePressed = mouse_check_button_pressed(mb_left)
if (_fireGrapplePressed)
{
	var grappleDirX = mouse_x - x
	var grappleDirY = mouse_y - y

	// Normalize
	var len = sqrt((grappleDirX * grappleDirX) + (grappleDirY * grappleDirY))
	grappleDirX = grappleDirX / len
	grappleDirY = grappleDirY / len
	
	// Place grapple
	var grappleOffset = 50
	var grappleId = instance_create_layer(x + (grappleDirX * grappleOffset), y + (grappleDirY * grappleOffset), "Rope", oGrapple)
	
	var impulse_end_x = grappleDirX * grappleAcceleration
	var impulse_end_y = grappleDirY * grappleAcceleration

	debug_impulse_end_x = impulse_end_x
	debug_impulse_end_y = impulse_end_y
	
	var pId = id
	var pFix = Fix
	with(grappleId) {
		playerId = pId
		playerFixture = pFix
		
		physics_apply_impulse(grappleId.phy_position_x, grappleId.phy_position_y, impulse_end_x, impulse_end_y)	
	}
	
	////////////////////////////
	/*
	switch (ropeState)
	{
		case rState.noRope:
		{
			grappleX = mouse_x;
			grappleY = mouse_y;
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(x, y, grappleX, grappleY);
			ropeLength = point_direction(x, y, grappleX, grappleY);
			
			Rope = instance_create_layer(grappleX, grappleY, "Rope", oRopeEnd);
			var playerId = id;
			with (Rope)
			{
				originX = playerId.x;
				originY = playerId.y;
				player = playerId;
				event_user(0);
			}
			
			ropeState = rState.throwing;
		}
		break;
		
		default:
		{
			ropeState = rState.noRope;
			instance_destroy(Rope.id);
		}
		break;
	}
	*/
}

// Stick rope is rope is stopped
if (ropeState != rState.noRope)
{
	if (Rope.speed == 0) ropeState = rState.stuck;
}

// Handle player movement
switch (playerState)
{
	case pState.normal:
	{
		//hSpeed = (_keyRight - _keyLeft) * walkSpeed;
		var dir = _keyRight - _keyLeft;
		hSpeed += dir * walkAcceleration;
		
		if (dir == 0)
		{
			var hFriction = hFrictionGround;
			if (!grounded) hFriction = hFrictionAir;
			hSpeed = approach(hSpeed, 0, hFriction);
		}
		hSpeed = clamp(hSpeed, -walkSpeed, walkSpeed);
		
		vSpeed += gravity_;
		
		if (_keyJump) && (grounded)
		{
			grounded = false;
			vSpeedFraction = 0;
			vSpeed = -jumpSpeed;
		}
		
		if (ropeState == rState.stuck) playerState = pState.swing;
	}
	break;
	
	case pState.swing:
	{
		if (ropeState == rState.noRope)
		{
			playerState = pState.endSwing;
		}
		else
		{
			//var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		
			//_ropeAngleAcceleration += (_keyRight - _keyLeft) * 0.08;
			//ropeLength += (_keyDown - _keyUp) * 2;
			//ropeLength = max(ropeLength, 0);
		
			//ropeAngleVelocity += _ropeAngleAcceleration;
			//ropeAngle += ropeAngleVelocity;
			//ropeAngleVelocity *= 0.99;
		
			//Rope.x = grappleX + lengthdir_x(ropeLength, ropeAngle);
			//Rope.y = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
			//hSpeed = Rope.x -x;
			//vSpeed = Rope.y - y;
		}
	}
	break;
	
	case pState.endSwing:
	{
		vSpeedFraction = 0;
		vSpeed = -jumpSpeed;
		playerState = pState.normal;
	}
	break;
}

hSpeed += hSpeedFraction;
vSpeed += vSpeedFraction;
hSpeedFraction = frac(hSpeed);
vSpeedFraction = frac(vSpeed);
hSpeed -= hSpeedFraction;
vSpeed -= vSpeedFraction;

if (place_meeting(x+hSpeed, y, oWall))
{
	var _hStep = sign(hSpeed);
	hSpeed = 0;
	hSpeedFraction = 0;
	while(!place_meeting(x+_hStep, y, oWall)) x += _hStep;
	if (playerState == pState.swing)
	{
		ropeAngle = point_direction(x, y, grappleX, grappleY);
		ropeAngleVelocity = 0;
	}
}
x += hSpeed;

if (place_meeting(x, y+vSpeed, oWall))
{
	var _vStep = sign(vSpeed);
	vSpeed = 0;
	vSpeedFraction = 0;
	while(!place_meeting(x, y+_vStep, oWall)) y += _vStep;
	if (playerState == pState.swing)
	{
		ropeAngle = point_direction(x, y, grappleX, grappleY);
		ropeAngleVelocity = 0;
	}
}
y += vSpeed;