// Time
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_alpha(image_alpha);
draw_set_color(image_blend);
draw_text_transformed(x, y, value, 0.5, 0.5, 0);
draw_set_color(c_white);
draw_set_alpha(1);