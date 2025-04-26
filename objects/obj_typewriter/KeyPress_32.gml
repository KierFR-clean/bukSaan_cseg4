if (keyboard_check_pressed(vk_space)) {
    var _len = string_length(text[text_current]);
    if (char_current >= _len) {
        if (text_current < text_last) {
            text_current += 1;
            text[text_current] = string_wrap(text[text_current], text_width);
            text[text_current] = string_replace_all(text[text_current], "\n", "\n\n ");
            char_current = 0;
            text_completed = false;
        } else {
            audio_stop_sound(snd_typewriter);
        }
    }
}