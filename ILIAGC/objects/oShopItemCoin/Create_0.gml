// Inherit the parent event
event_inherited();

// Text
description = "Item";
longDescription = "This is an item.";
price = 10;
interactDescription = "Buy?";

/// @func	onCollect();
onCollect = function()
{
	show_debug_message(description + "bought!");
}

/// @func	drawDescription();
drawDescription = function()
{
	draw_text_ext_transformed(x, y - 6, description + " \n($" + string(price) + ")", 14, 64, 0.5, 0.5, 0);
}