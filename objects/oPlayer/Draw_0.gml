//if (state = pState.swing) draw_line_width(grappleX, grappleY, ropeX, ropeY, 2);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);	

// Draw dem ropes
var len = array_length_1d(stackRopeSegmentObj)
var curObj = id
for (var i = 0; i < len; i++) {
	var nextObj = stackRopeSegmentObj[i]
	
	var rot = point_direction(curObj.x, curObj.y, nextObj.x, nextObj.y) + 90

	draw_sprite_ext(sRope, 0, curObj.x, curObj.y, 0.6, 0.6, rot, c_white, 1)
	
	curObj = nextObj
}

if global.physDebug {
	physics_draw_debug();

	draw_arrow(debugX, debugY, debugTargetX, debugTargetY, 15)
}
