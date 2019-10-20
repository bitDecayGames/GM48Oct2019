if (player != -1)
{
	ropeEndDistToPlayer = point_distance(x, y, originX, originY);
	ropeStartSegment = ds_stack_top(stackRopeSegmentObj);
	ropeStartSegmentFix = ds_stack_top(stackRopeSegmentFix);
	ropeStartDistToPlayer = point_distance(ropeStartSegment.x, ropeStartSegment.y, player.x, player.y);

	//if (ropeEndDistToPlayer > maxLength)
	//{
	//	player.ropeState = rState.noRope;
	//	instance_destroy(id);
	//}

	// Create new rope segment
	if (!stopMakingRope)
	{
		vx = player.x - ropeStartSegment.x;
		vy = player.y - ropeStartSegment.y;
		len = sqrt(vx * vx + vy * vy);
		vx = vx / len;
		vy = vy / len;

		newSegmentX = ropeStartSegment.x + vx * ropeDistCreateSegment;
		newSegmentY = ropeStartSegment.y + vy * ropeDistCreateSegment;

		var newRopeSegment = instance_create_layer(newSegmentX, newSegmentY, "Rope", oRope);
		var newRopeSegmentFix = physics_fixture_create();
		physics_fixture_set_box_shape(newRopeSegmentFix, newRopeSegment.sprite_width / 4, newRopeSegment.sprite_height / 4);
		physics_fixture_bind(newRopeSegmentFix, newRopeSegment);
	
		var connectingFix = physics_fixture_create();
		physics_fixture_bind(connectingFix, newRopeSegmentFix);
		physics_fixture_bind(connectingFix, ropeStartSegmentFix);
		physics_joint_distance_create(newRopeSegment, ropeStartSegment, newRopeSegment.x, newRopeSegment.y, ropeStartSegment.x, ropeStartSegment.y, false);
	
		ds_stack_push(stackRopeSegmentObj, newRopeSegment);
		ds_stack_push(stackRopeSegmentFix, newRopeSegmentFix);
		
		physics_fixture_delete(connectingFix);
		
		show_debug_message(ropeStartDistToPlayer);

		if (ropeStartDistToPlayer < 40 && anchored)
		{
			var playerConnectingFix = physics_fixture_create();
			physics_fixture_bind(playerConnectingFix, newRopeSegmentFix);
			physics_fixture_bind(playerConnectingFix, playerFix);
			physics_joint_distance_create(newRopeSegment, player, newRopeSegment.x, newRopeSegment.y, player.x, player.y, false);

			stopMakingRope = true;
		}
		
		physics_fixture_delete(newRopeSegmentFix);
	}
	// Destroy last rope segment
	//if (ds_stack_size(stackRopeSegmentObj) > 1 && ropeStartDistToPlayer < ropeDistDestroySegment)
	//{
	//	instance_destroy(ds_stack_pop(stackRopeSegmentObj));
	//	instance_destroy(ds_stack_pop(stackRopeSegmentFix));
	//}
}