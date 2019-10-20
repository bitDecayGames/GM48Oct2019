draw_self();

physics_draw_debug();

if player != pointer_null {
	draw_set_color(c_red)
	draw_circle(player.x, player.y, 10, false)
	
	if ds_stack_size(stackRopeSegmentObj) > 0 {
		var seg = ds_stack_top(stackRopeSegmentObj);
		
		draw_set_color(c_green)
		draw_circle(seg.x, seg.y, 10, false);
		
		draw_arrow(seg.x, seg.y, player.x, player.y, 10)
	}
}