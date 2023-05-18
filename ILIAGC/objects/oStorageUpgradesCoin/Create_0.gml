// Inherit the parent event
event_inherited();

// Text
description = "Upgrades";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	var _x = 32, _y = 136;
	for (var _i = 0; _i < array_length(oGame.myUpgrades); _i++)
	{
		// Get upgrade
		var _upgrade = oGame.myUpgrades[_i][0];
		
		// Spawn coin
		var _inst = instance_create_layer(_x, _y, "Instances", oToggleUpgradeCoin);
		with (_inst)
		{
			// Set coin
			upgrade = _upgrade;
			description = getUpgradeName(upgrade);
			
			// If unlocked
			if (oGame.myUpgrades[_i][1] > 0)
			{
				// Set toggleable
				sprite_index = getUpgradeSprite(upgrade);
				canToggle = true;
				
				// Toggle on if active
				if (upgrade == Upgrade.EQUATION_UP && array_length(oGrapher.graphs) > 2) toggledOn = true;
			}
		}
		
		// Update position
		if (_x >= 160)
		{
			_x = 32;
			_y -= 32;
		}
		else _x += 32;
	}
}