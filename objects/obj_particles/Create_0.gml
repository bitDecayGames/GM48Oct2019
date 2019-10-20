/// @description Insert description here
// You can write your code in this editor

has_fired = false;

part_system = part_system_create();
part_emitter = part_emitter_create(part_system);
part_type = part_type_create();

part_type_sprite(part_type, prt_blood, false, false, false);
part_type_alpha3(part_type, 1, 1, 0);
part_type_life(part_type, 10, 50);
part_type_speed(part_type, 1, 2, 0, 0);
part_type_direction(part_type, 0, 359, 0, 0);
part_system_depth(part_type, -9999999)
