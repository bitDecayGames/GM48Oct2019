var Fix = physics_fixture_create();
physics_fixture_set_box_shape(Fix, sprite_width / 2, sprite_height / 2);
physics_fixture_bind(Fix, id);
physics_fixture_delete(Fix);