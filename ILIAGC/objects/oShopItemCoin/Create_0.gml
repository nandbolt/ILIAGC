// Inherit the parent event
event_inherited();

// Text
description = "Item";
longDescription = "This is an item.";
price = 10;

/// @func	onCollect();
onCollect = function()
{
	show_debug_message(description + "bought!");
}