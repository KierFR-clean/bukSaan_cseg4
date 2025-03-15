if keyboard_check_pressed(vk_up) {
	s_option = max(0, s_option -1) // just to know if there's choice
}
//reverse the up func
if keyboard_check_pressed(vk_down) {
	s_option = min(array_length(options) - 1, s_option + 1) // just to know if there's choice
}

if keyboard_check_pressed(vk_enter) {
	switch(s_option) {
		case 0:
			room_goto(rm_living);//go to opening scene
			break;
		case 1: //la paang settings
			break;
		case 2:
			game_end();
			break;
	}   
	
}



