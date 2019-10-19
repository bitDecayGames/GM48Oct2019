/// @description draw text

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(main_font);

for (var i = 0; i < itemLen; i++){
	draw_text(x, y + i * itemHeight + (selected == i ? -5 : 0) - 15, items[i]);
}
