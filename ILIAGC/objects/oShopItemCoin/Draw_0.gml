// Inherit the parent event
event_inherited();

// Price
draw_set_valign(fa_top);
draw_set_alpha(0.5);
draw_text_ext_transformed(x, y + 6, string(price), 14, 64, 0.5, 0.5, 0);
draw_set_alpha(1);