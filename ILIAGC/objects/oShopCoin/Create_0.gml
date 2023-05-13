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
	var _shopUpgrades = [];
	for (var _i = 0; _i < array_length(oGame.myUpgrades); _i++)
	{
		var _lvl = oGame.myUpgrades[_i][1];
		if (_lvl == 0) array_push(_shopUpgrades, oGame.myUpgrades[_i]);
	}
	var _shopMisc = [];
	for (var _i = 0; _i < array_length(oGame.myMisc); _i++)
	{
		var _lvl = oGame.myMisc[_i][1];
		if (_lvl == 0) array_push(_shopMisc, oGame.myMisc[_i]);
	}
	var _shopTheme = [];
	for (var _i = 0; _i < array_length(oGame.myTheme); _i++)
	{
		var _lvl = oGame.myTheme[_i][1];
		if (_lvl == 0) array_push(_shopTheme, oGame.myTheme[_i]);
	}
	
	// Show available shop items
	for (var _y = 64; _y <= 128; _y += 64)
	{
		for (var _x = 48; _x <= 144; _x += 48)
		{
			// If shop has powerup inventory
			if (array_length(_shopPowerups) > 0)
			{
				// Spawn random shop item and remove from backstock
				var _i = irandom(array_length(_shopPowerups) - 1);
				shopSpawnItemPowerup(_shopPowerups[_i][0], _x, _y, _shopPowerups[_i][1] + 1);
				array_delete(_shopPowerups, _i, 1);
			}
			// Else if shop has upgrade inventory
			else if (array_length(_shopUpgrades) > 0)
			{
				// Spawn random shop item and remove from backstock
				var _i = irandom(array_length(_shopUpgrades) - 1);
				shopSpawnItemUpgrade(_shopUpgrades[_i][0], _x, _y, _shopUpgrades[_i][1] + 1);
				array_delete(_shopUpgrades, _i, 1);
			}
			// Else if shop has misc inventory
			else if (array_length(_shopMisc) > 0)
			{
				// Spawn random shop item and remove from backstock
				var _i = irandom(array_length(_shopMisc) - 1);
				shopSpawnItemMisc(_shopMisc[_i][0], _x, _y, _shopMisc[_i][1] + 1);
				array_delete(_shopMisc, _i, 1);
			}
			// Else if shop has theme inventory
			else if (array_length(_shopTheme) > 0)
			{
				// Spawn random shop item and remove from backstock
				var _i = irandom(array_length(_shopTheme) - 1);
				shopSpawnItemTheme(_shopTheme[_i][0], _x, _y, _shopTheme[_i][1] + 1);
				array_delete(_shopTheme, _i, 1);
			}
		}
	}
}