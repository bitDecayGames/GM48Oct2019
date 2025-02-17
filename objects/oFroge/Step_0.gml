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
	var grappleId = instance_create_layer(x + (grappleDirX * grappleOffset), y + (grappleDirY * grappleOffset), "Instances", oGrapple)
	
	var impulse_end_x = grappleDirX * grappleAcceleration
	var impulse_end_y = grappleDirY * grappleAcceleration

	debug_impulse_end_x = impulse_end_x
	debug_impulse_end_y = impulse_end_y
	
	with(grappleId) {
		physics_apply_impulse(grappleId.phy_position_x, grappleId.phy_position_y, impulse_end_x, impulse_end_y)	
	}
}

/*
switch (state)
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
		
		//if (_keyJump) && (grounded)
		//{
		//	grounded = false;
		//	vSpeedFraction = 0;
		//	vSpeed = -jumpSpeed;
		//}
		
		// Throw rope
		if (mouse_check_button_pressed(mb_left))
		{
			grappleX = mouse_x;
			grappleY = mouse_y;
			//ropeX = x;
			//ropeY = y;
			var ropeAngle = point_direction(x, y, grappleX, grappleY);
			
			with (instance_create_layer(x, y, "Rope", oRopeEnd))
			{
				speed = 25;
				direction = ropeAngle;
			}
			
			//ropeAngleVelocity = 0;
			//ropeAngle = point_direction(grappleX, grappleY, x, y);
			//ropeLength = point_direction(grappleX, grappleY, x, y);
			//state = pState.swing;
		}
		
	}
	break;
	
	case pState.swing:
	{
		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		
		_ropeAngleAcceleration += (_keyRight - _keyLeft) * 0.08;
		ropeLength += (_keyDown - _keyUp) * 2;
		ropeLength = max(ropeLength, 0);
		
		ropeAngleVelocity += _ropeAngleAcceleration;
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.99;
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
		hSpeed = ropeX -x;
		vSpeed = ropeY - y;
		
		if (mouse_check_button_pressed(mb_left))
		{
			state = pState.normal;
			vSpeedFraction = 0;
			vSpeed = -jumpSpeed;
		}
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
	if (state == pState.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
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
	if (state == pState.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
}
y += vSpeed;

*/