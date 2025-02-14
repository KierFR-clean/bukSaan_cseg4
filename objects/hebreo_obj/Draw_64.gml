if global.show_prompt {
	
	draw_roundrect(x - 100, y + 20, x + 100, y + 70, false);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
	draw_text_color(x, y + 45, "Press [1] to interact", c_black, c_red, c_black, c_red, 0.9);
}

if (global.dialogue != "") 
{
	var box_w =700;
	var box_h = 120;
	var box_x = 120;
	var box_y = 500;
	draw_set_color(c_white);

	draw_roundrect(box_x, box_y, box_x + box_w, box_y + box_h, false);   
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	var t_x = box_x + 20;
    var t_y = box_y + 15;
	
	draw_triangle(t_x - 10, t_y + 10, t_x - 5, t_y + 15, t_x - 10, t_y + 20, false);
	draw_triangle_color(t_x - 10, t_y + 10, t_x - 5, t_y + 15, t_x - 10, t_y + 20, c_red, c_red, c_red, false)
	draw_text(t_x, t_y + 30, global.dialogue);
}

