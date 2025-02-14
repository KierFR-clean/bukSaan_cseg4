//the alignment
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
for (var index = 0; index < array_length(options); index++) {
	var color = c_white; // white nasa figma
	if index == s_option color = c_aqua;
	//itev draw color txt
	draw_text_color(m_x, m_y + (index * s), options[index], color, color, color, color, 1);
}
