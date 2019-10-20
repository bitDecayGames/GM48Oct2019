if (!enable_player_input) return;

grounded = (place_meeting(x, y+1, oWall));

var _keyLeft = keyboard_check(ord("A"));
var _keyRight = keyboard_check(ord("D"));
var _keyUp = keyboard_check(ord("W"));
var _keyDown = keyboard_check(ord("S"));
var _keyJump = keyboard_check(vk_space);

//animation logic
if(image_index > image_number-1 && sprite_index == spr_throw_frog) image_speed = 0;
if(image_index > image_number-1 && sprite_index == spr_start_swing_frog) 
{
	sprite_index = spr_swinging_frog;
}

// Calculate impulse vector
var segObjLen = array_length_1d(stackRopeSegmentObj)
if segObjLen > 0 {
	var targetSegObj = stackRopeSegmentObj[0]

	var connectionDirX = targetSegObj.phy_position_x - phy_position_x
	var connectionDirY = targetSegObj.phy_position_y - phy_position_y
	// Normalize
	var len = sqrt((connectionDirX * connectionDirX) + (connectionDirY * connectionDirY))
	connectionDirX = connectionDirX / len
	connectionDirY = connectionDirY / len
	
	// Find vector 90 degrees from forwards or backwards
	var tempY = connectionDirY
	connectionDirY = -connectionDirX
	connectionDirX = tempY

	var impulseX = connectionDirX * acceleration
	var impulseY = connectionDirY * acceleration

	var aX = 0
	var aY = 0
	if _keyLeft {
		image_xscale = -1;
		aX += impulseX
		aY += impulseY
	} else if _keyRight {
		image_xscale = 1;
		aX -= impulseX
		aY -= impulseY
	}
	physics_apply_impulse(phy_position_x, phy_position_y, aX, aY);

	debugX = phy_position_x
	debugY = phy_position_y
	debugTargetX = phy_position_x + aX * 10
	debugTargetY = phy_position_y + aY * 10
} else {
	/*
	// Walking
	var walkAX = 0
	if _keyLeft {
		image_xscale = -1;
		walkAX -= acceleration
	} else if _keyRight {
		image_xscale = 1;
		walkAX += acceleration
	}
	physics_apply_impulse(phy_position_x, phy_position_y, walkAX, 0);
	*/
}

if (mouse_check_button_pressed(mb_left))
{
	if (grappleId == pointer_null)
	{
		if global.currentRopeId != pointer_null {
			instance_destroy(global.currentRopeId)
			global.currentRopeId = pointer_null
		}
	
		var len = array_length_1d(stackRopeSegmentObj)
		if (len > 0 && !ds_stack_empty(stackRopeJoints))
		{
			for (var i = 0; i < len; i++) {
				instance_destroy(stackRopeSegmentObj[i])		
			}
			stackRopeSegmentObj = array_create(0)
			while(ds_stack_size(stackRopeJoints) > 0) physics_joint_delete(ds_stack_pop(stackRopeJoints))
			
			sprite_index = sFroge;
		}
		else
		{
			var grappleDirX = mouse_x - x
			var grappleDirY = mouse_y - y

			// Normalize
			var len = sqrt((grappleDirX * grappleDirX) + (grappleDirY * grappleDirY))
			grappleDirX = grappleDirX / len
			grappleDirY = grappleDirY / len
	
			// Place grapple
			var grappleOffset = 50
			grappleId = instance_create_layer(x + (grappleDirX * grappleOffset), y + (grappleDirY * grappleOffset), "Rope", oGrapple)
	
			var impulse_end_x = grappleDirX * grappleAcceleration
			var impulse_end_y = grappleDirY * grappleAcceleration
	
			var pId = id
			with(grappleId) {
				playerId = pId
		
				physics_apply_impulse(phy_position_x, phy_position_y, impulse_end_x, impulse_end_y)
			}
			
			image_speed = 1;
			sprite_index = spr_throw_frog;
			
		}
	}
} else if (!mouse_check_button(mb_left)) {
	if (grappleId != pointer_null){
		instance_destroy(grappleId)
	}
	if (global.currentRopeId != pointer_null) {
		instance_destroy(global.currentRopeId)
		global.currentRopeId = pointer_null
	}
	var len = array_length_1d(stackRopeSegmentObj)
	if (len > 0 && !ds_stack_empty(stackRopeJoints))
	{
		for (var i = 0; i < len; i++) {
			instance_destroy(stackRopeSegmentObj[i])		
		}
		stackRopeSegmentObj = array_create(0)
		while(ds_stack_size(stackRopeJoints) > 0) physics_joint_delete(ds_stack_pop(stackRopeJoints))
		sprite_index = sFroge;
	}
}