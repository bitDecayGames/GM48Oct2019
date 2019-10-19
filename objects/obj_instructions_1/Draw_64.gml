/// @description draw credits

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(main_font);

for (var i = 0; i < itemLen; i++){
	draw_text(x + 60, y - 70 + i * itemHeight, items[i]);
}
