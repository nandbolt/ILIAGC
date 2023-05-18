// Inherit the parent event
event_inherited();

// Description
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_alpha(0.5);
draw_text_ext_transformed(x, y - 6, description, 14, 64, 0.5, 0.5, 0);
draw_set_alpha(1);