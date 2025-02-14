if keyboard_check_pressed(vk_enter) {
	if keyboard_string == converted {
		global.dialogue = "Finally! It works!!!";
		global.diag_instance.alarm[0] = 3 * room_speed;
		hebreo_obj.move_speed = 1;
	} else {
		global.dialogue = "Nah uh!!! Try again.";	
		global.diag_instance.alarm[0] = 3 * room_speed;
		hebreo_obj.move_speed = 1;
	}
	instance_destroy();
	
}

