if (current_state == SceneState.DIALOGUE) {

    draw_set_color(c_white);
    draw_set_alpha(0.7);
    draw_rectangle(20, room_height - 100, room_width - 60, room_height - 20, false);
    draw_set_alpha(1);
    

    draw_set_color(c_black);
    draw_set_font(fnt_dialogue);  
    draw_text_ext(30, room_height - 90, dialogue_text, 20, dialogue_width);
}

if (current_state == SceneState.EMILIO_WALKING && path_to_follow != -1) {
    draw_path(path_to_follow, 0, 0, true);
}


if (current_state == SceneState.FADE_OUT || current_state == SceneState.FADE_IN) {
    draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}

// Clean Up 


