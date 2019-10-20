draw_self();

draw_set_colour(c_white);

draw_line_width_color(x, y, playerId.x, playerId.y, 3, c_red, c_yellow)	

if global.physDebug {
	physics_draw_debug();	
}