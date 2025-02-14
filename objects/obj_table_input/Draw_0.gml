var box_x = 20;
var box_y = 40;
var box_w = 240;
var box_h = 140; //tinimes 2 lang sa correspond
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_roundrect(box_x,box_y,box_w,box_h, false); 

draw_set_alpha(1);
draw_set_color(c_white);
draw_roundrect(box_x,box_y,box_w,box_h, false); 

var t_x = box_x + 20;	
var t_y = box_y + 20;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_text(t_x, t_y, "Enter answer: ");
draw_text(t_x, t_y + 12, keyboard_string);	
draw_set_halign(fa_center);
draw_set_font(fnt_diag);
draw_set_valign(fa_middle);
draw_text_color(box_x + (box_w/2), box_y + box_h - 5, "Press Enter to check", c_black, c_red, c_black, c_red, 0.9);