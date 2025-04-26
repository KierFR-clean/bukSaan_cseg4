draw_set_font(press_start);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

var _len = string_length(text[text_current]);
var _old_char_current = floor(char_current);

if (char_current < _len) {
    char_current += char_speed;
    
    // Play typewriter sound every other character
    if (floor(char_current) > _old_char_current && floor(char_current) % 2 == 0) {
        audio_play_sound(snd_typewriter, 1, false);
    }
} else {
    // Stop typewriter sound when text is fully displayed
    audio_stop_sound(snd_typewriter);
    text_completed = true; // Set text_completed to true when text is fully shown
}

var _str = string_copy(text[text_current], 1, floor(char_current));
draw_text(text_x, text_y, _str);

var skip_x = 920;
var skip_y = text_y + 800;
var alpha = 0.5 + sin(current_time / 300) * 0.5; 
draw_set_alpha(alpha);



var original_font = draw_get_font();
draw_set_font(press_start);
draw_set_colour(c_orange);

var org_width = sprite_get_width(spr_space_button);
var s_x = 300/ org_width;
var s_y = s_x;

if (text_current < text_last) {
    draw_text(skip_x, skip_y, "Press SPACE to skip.");
	var frame = floor(current_time / 200) % sprite_get_number(spr_space_button);
	draw_sprite_ext(spr_space_button, frame, 920, 840, s_x, s_y, 0, c_white, alpha);
} else if (text_current >= text_last && text_completed) {
    draw_text(skip_x, skip_y, "Press Enter to start game.");
	var frame_enter = floor(current_time / 200) % sprite_get_number(spr_enter_button);
	draw_sprite_ext(spr_enter_button, frame_enter, 920, 840, s_x, s_y, 0, c_white, alpha);
}

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(original_font);