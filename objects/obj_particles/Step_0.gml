/// @description Insert description here
// You can write your code in this editor

if(!has_fired || mouse_check_button_pressed(mb_left)){
	has_fired = true;
	part_emitter_region(part_system, part_emitter, x, x, y, y, 
		ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(part_system, part_emitter, part_type, 40);	
}