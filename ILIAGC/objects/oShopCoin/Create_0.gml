// Inherit the parent event
event_inherited();

// Text
description = "Shop";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 160, "Instances", oHomeCoin);
	
	// Gather all potential shop items
	var _shopPowerups = [];
	for (var _i = 0; _i < array_length(oGame.myPowerups); _i++)
	{
		var _lvl = oGame.myPowerups[_i][1];
		if (_lvl == 0) array_push(_shopPowerups, oGame.myPowerups[_i]);
	}
	
	// Show available shop items
	for (var _y = 64; _y <= 128; _y += 64)
	{
		for (var _x = 48; _x <= 144; _x += 48)
		{
			// If shop has inventory
			if (array_length(_shopPowerups) > 0)
			{
				// Spawn random shop item and remove from backstock
				var _i = irandom(array_length(_shopPowerups) - 1);
				shopSpawnItemPowerup(_shopPowerups[_i][0], _x, _y, _shopPowerups[_i][1] + 1);
				array_delete(_shopPowerups, _i, 1);
			}
		}
	}
}