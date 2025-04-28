
if (show_note_msg) {
    draw_set_color(c_white);
    //draw_set_alpha(0.7);
    draw_rectangle(20, room_height - 100, room_width - 60, room_height - 20, false);
    //draw_set_alpha(1);
   
    draw_set_color(c_black);
    draw_set_font(fnt_dialogue);  
    draw_text_ext(30, room_height - 90, "Ang bagyo ay nakatago sa... bagyo!. Hmmm...", 20, room_width - 100);
 
}

