// Inherit the parent event
event_inherited();

// Text
description = "Powerups";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	var _x = 32, _y = 136;
	for (var _i = 0; _i < array_length(oGame.myPowerups); _i++)
	{
		// Get powerup
		var _powerup = oGame.myPowerups[_i][0];
		
		// Spawn coin
		var _inst = instance_create_layer(_x, _y, "Instances", oTogglePowerupCoin);
		with (_inst)
		{
			// If unlocked
			if (oGame.myPowerups[_powerup][1] > 0)
			{
				// Set coin
				powerup = _powerup;
				description = getPowerupName(powerup, 0);
				
				// Set toggleable
				sprite_index = getPowerupSprite(powerup, 0);
				canToggle = true;
				
				// Find powerup location in array
				var _powerupObject = getPowerupObject(powerup);
				for (var _j = 0; _j < array_length(oWorld.powerups); _j++)
				{
					// If found powerup
					if (oWorld.powerups[_j] == _powerupObject)
					{
						// Toggle on
						toggledOn = true;
						break;
					}
				}
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