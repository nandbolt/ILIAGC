// Inherit the parent event
event_inherited();

// Coins in bank
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed(x + 8, y, "collected: " + string(oWorld.coins), 0.5, 0.5, 0);