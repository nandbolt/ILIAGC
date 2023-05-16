// Inherit the parent event
event_inherited();

// Text
description = "Misc";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 160, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	var _x = 32, _y = 128;
	for (var _i = 0; _i < array_length(oGame.myMisc); _i++)
	{
		// Get misc
		var _misc = oGame.myMisc[_i][0];
		
		// Spawn coin
		var _inst = instance_create_layer(_x, _y, "Instances", oToggleMiscCoin);
		with (_inst)
		{
			// Set coin
			misc = _misc;
			description = getMiscName(misc);
			
			// If unlocked
			if (oGame.myMisc[_i][1] > 0)
			{
				// Set toggleable
				sprite_index = getMiscSprite(misc);
				canToggle = true;
				
				// Toggle on if active
				if (misc == Misc.DEBUG_MODE && instance_exists(oDebug)) toggledOn = true;
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