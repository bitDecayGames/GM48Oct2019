// if (state = pState.swing) draw_line_width(grappleX, grappleY, ropeX, ropeY, 2);

draw_self();

draw_set_colour(c_white);
physics_draw_debug();

draw_arrow(x, y, x + (debug_impulse_end_x * 3), y + (debug_impulse_end_y * 3), 15)