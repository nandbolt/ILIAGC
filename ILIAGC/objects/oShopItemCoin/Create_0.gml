// Inherit the parent event
event_inherited();

// Text
description = "Item";
longDescription = "This is an item.";
price = 10;
interactDescription = "Buy?";

// Saving
itemTypeString = "";
itemName = "";
itemValue = 0;

/// @func	buyItem();
buyItem = function(){}

/// @func	onCollect();
onCollect = function()
{
	// Buy item
	buyItem();
	
	// If a saveable purchase
	if (itemTypeString != "")
	{
		// Save item purchase
		ini_open("save.ini");
		ini_write_real(itemTypeString, itemName, itemValue);
		ini_close();
	}
}

/// @func	drawDescription();
drawDescription = function()
{
	draw_text_ext_transformed(x, y - 6, description + "\n($" + string(price) + ")", 14, 64, 0.5, 0.5, 0);
}