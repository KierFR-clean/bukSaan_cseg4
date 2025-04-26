var _len = string_length(text[text_current]);
if (keyboard_check_pressed(vk_space)) {
    char_current = _len;
    audio_stop_sound(snd_typewriter); 
	
}

if (char_current >= _len) {
    text_completed = true;
  
    if (mouse_check_button_pressed(mb_left)) {
        if (text_current < text_last) {
            text_current += 1;
            text[text_current] = string_wrap(text[text_current], text_width);
            text[text_current] = string_replace_all(text[text_current], "\n", "\n\n ");
            char_current = 0;
            text_completed = false;
        }
    }
}
if (text_current >= text_last && keyboard_check_pressed(vk_enter)) {
	
    room_goto(rm_living); 
}