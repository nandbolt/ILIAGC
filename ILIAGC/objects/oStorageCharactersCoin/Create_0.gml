// Inherit the parent event
event_inherited();

// Text
description = "Characters";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	var _x = 32, _y = 136;
	for (var _i = 0; _i < array_length(oGame.myCharacters); _i++)
	{
		// Get character
		var _character = oGame.myCharacters[_i][0];
		
		// Spawn coin
		var _inst = instance_create_layer(_x, _y, "Instances", oToggleCharacterCoin);
		with (_inst)
		{
			// Set coin
			character = _character;
			description = getCharacterName(character);
			
			// If unlocked
			if (oGame.myCharacters[character][1] > 0)
			{
				// Set toggleable
				sprite_index = getCharacterSprite(character);
				canToggle = true;
				
				// Toggle on if current character
				if (oPlayer.object_index == getCharacterObject(character)) toggledOn = true;
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