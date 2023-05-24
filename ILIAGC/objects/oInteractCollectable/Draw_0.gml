// Inherit the parent event
event_inherited();

// Description
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
//draw_set_color(c_gray);
draw_set_alpha(image_alpha);
drawDescription();
draw_set_alpha(1);
//draw_set_color(c_white);