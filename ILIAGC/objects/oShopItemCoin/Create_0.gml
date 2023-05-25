// Inherit the parent event
event_inherited();

// Item
itemIdx = -1;
itemType = -1;

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
		ini_write_real("inventory", "coins_in_bank", oWorld.coinsInBank);
		ini_close();
	}
	
	// Remove item from shop items
	for (var _i = 0; _i < array_length(oWorld.shopItems); _i++)
	{
		// If found item
		if (oWorld.shopItems[_i][0] == itemType && oWorld.shopItems[_i][1] == itemIdx)
		{
			// Delete item from shop items
			array_delete(oWorld.shopItems, _i, 1);
		}
	}
}

/// @func	drawDescription();
drawDescription = function()
{
	draw_text_ext_transformed(x, y - 6, description + "\n($" + string(price) + ")", 14, 64, 0.5, 0.5, 0);
}