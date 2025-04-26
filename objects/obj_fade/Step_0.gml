if (state == "fade_in") {
    alpha += fade_speed;
    if (alpha >= 1) {
		room_goto(target_room);
        obj_emilio.x = target_x;
        obj_emilio.y = target_y;
        state = "fade_out";
		 }
} else if (state == "fade_out") {
    alpha -= fade_speed;
    if (alpha <= 0) {
		 instance_destroy();
	}
}

blink_timer += blink_speed;
if (blink_timer >= 60) {
    blink_timer = 0;
}
if (blink_timer mod 40 < 20) {
    blink_color = c_gray;
} else {
    blink_color = c_black;
}