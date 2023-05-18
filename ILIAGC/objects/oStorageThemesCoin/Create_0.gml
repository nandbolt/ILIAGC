// Inherit the parent event
event_inherited();

// Text
description = "Themes";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	var _x = 32, _y = 136;
	for (var _i = 0; _i < array_length(oGame.myTheme); _i++)
	{
		// Get theme
		var _theme = oGame.myTheme[_i][0];
		
		// Spawn coin
		var _inst = instance_create_layer(_x, _y, "Instances", oToggleThemeCoin);
		with (_inst)
		{
			// If unlocked
			if (oGame.myTheme[_theme][1] > 0)
			{
				// Set coin
				theme = _theme;
				description = getThemeName(_theme);
				
				// Set toggleable
				sprite_index = getThemeSprite(_theme);
				canToggle = true;
				
				// Toggle on if current theme
				if (oWorld.currentTheme == _theme) toggledOn = true;
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