var horizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
var vertical = keyboard_check(vk_down) - keyboard_check(vk_up);
//collision, stop two var from moving if meet, add speed as well
if horizontal != 0 {
	if !place_meeting(x + horizontal * move_speed, y, obj_wall) {
		x += horizontal * move_speed;	
	}
}

if vertical != 0 {
	if !place_meeting(x, y + vertical * move_speed, obj_wall) {
		y += vertical * move_speed;
	}
}



//if place_meeting(x + horizontal * move_speed, y, obj_wall)horizontal = 0;
//if place_meeting(x, y + vertical * move_speed, obj_wall)vertical = 0;


//dec by y-pos


if horizontal == 0 && vertical == 0 {
	image_speed = 0 //recreate for meanwhile ung non-movement stance
	image_index = 0; //first img
} else {
	//ung speed itoggle by 1 to enable si frames
	image_speed =1;
if vertical > 0 sprite_index = sprite[DOWN];
else if vertical < 0 sprite_index = sprite[UP];
else if horizontal > 0 sprite_index = sprite[RIGHT];
else if horizontal < 0 sprite_index = sprite[LEFT];

}

show_debug_message(">>" + string(global.show_prompt));



depth =- bbox_bottom;

