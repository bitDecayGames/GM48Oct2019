maxLength = 300;
originX = 0;
originY = 0;
ropeDistCreateSegment = 10;
ropeDistDestroySegment = 7;
player = -1;
firstSegmentCreated = false;
stopMakingRope = false;
anchored = false;
stackRopeSegmentObj = ds_stack_create();
stackRopeSegmentFix = ds_stack_create();

ropeEndFix = physics_fixture_create();
physics_fixture_set_circle_shape(ropeEndFix, sprite_height / 2);
physics_fixture_bind(ropeEndFix, id);