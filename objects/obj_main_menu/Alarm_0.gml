/// @description go to screen

switch(items[selected]) {
	case "Start":
		room_goto(rm_instructions);
		break;
	case "Credits":
		room_goto(rm_credits);
		break;
	case "Quit":
		game_end();
		break;
}
