/// @description handle input

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	selected -= 1;
	changed = true;
} else if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	selected += 1;
	changed = true;
}

if (selected >= itemLen) selected = 0;
if (selected < 0) selected = itemLen - 1;

if (changed) {
	for (var i = 0; i < itemLen; i++) {
		if (i == selected) objs[i].image_index = 1;	
		else objs[i].image_index = 0;
	}
	changed = false;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	switch(items[selected]) {
		case "Start":
			room_goto_next();
			break;
		case "Credits":
			room_goto(room0);
			break;
		case "Quit":
			game_end();
			break;
	}
}

