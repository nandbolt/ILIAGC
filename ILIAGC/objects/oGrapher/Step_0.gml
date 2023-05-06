// If editing equation
if (editingEquation)
{
	// Toggle info
	if (keyboard_check_pressed(ord("H"))) showInfo = !showInfo;
	else if (keyboard_check_pressed(vk_left))
	{
		// Toggle previous graph
		if (graphIdx == 0) graphIdx = array_length(graphs) - 1;
		else graphIdx--;
	}
	else if (keyboard_check_pressed(vk_right))
	{
		// Toggle next graph
		if (graphIdx == array_length(graphs) - 1) graphIdx = 0;
		else graphIdx++;
	}
	
	#region Check Equation Inputs
	
	// Check last character
	var _lc = string_lower(keyboard_lastchar);
	if (getGraphEquationInput()) graphEquation();
	else if (_lc == "\b" && array_length(graphs[graphIdx][0]) > 0) array_pop(graphs[graphIdx][0]);
	else if (_lc == "0" && !keyboard_check(vk_shift)) array_push(graphs[graphIdx][0], TokenIndexs.NUM0);
	else if (_lc == "1") array_push(graphs[graphIdx][0], TokenIndexs.NUM1);
	else if (_lc == "2") array_push(graphs[graphIdx][0], TokenIndexs.NUM2);
	else if (_lc == "3") array_push(graphs[graphIdx][0], TokenIndexs.NUM3);
	else if (_lc == "4") array_push(graphs[graphIdx][0], TokenIndexs.NUM4);
	else if (_lc == "5") array_push(graphs[graphIdx][0], TokenIndexs.NUM5);
	else if (_lc == "6" && !keyboard_check(vk_shift)) array_push(graphs[graphIdx][0], TokenIndexs.NUM6);
	else if (_lc == "7") array_push(graphs[graphIdx][0], TokenIndexs.NUM7);
	else if (_lc == "8" && !keyboard_check(vk_shift)) array_push(graphs[graphIdx][0], TokenIndexs.NUM8);
	else if (_lc == "9" && !keyboard_check(vk_shift)) array_push(graphs[graphIdx][0], TokenIndexs.NUM9);
	else if (_lc == "x") array_push(graphs[graphIdx][0], TokenIndexs.X);
	else if (_lc == "+") array_push(graphs[graphIdx][0], TokenIndexs.PLUS);
	else if (_lc == "-") array_push(graphs[graphIdx][0], TokenIndexs.MINUS);
	else if (_lc = "*") array_push(graphs[graphIdx][0], TokenIndexs.ASTERISK);
	else if (_lc = "/") array_push(graphs[graphIdx][0], TokenIndexs.SLASH);
	else if (_lc = "^") array_push(graphs[graphIdx][0], TokenIndexs.CARROT);
	else if (_lc == "(") array_push(graphs[graphIdx][0], TokenIndexs.OPEN_PARENTHESIS);
	else if (_lc == ")") array_push(graphs[graphIdx][0], TokenIndexs.CLOSE_PARENTHESIS);
	else if (_lc == "s") array_push(graphs[graphIdx][0], TokenIndexs.SINE);
	else if (_lc == "c") array_push(graphs[graphIdx][0], TokenIndexs.COSINE);
	else if (_lc == "t") array_push(graphs[graphIdx][0], TokenIndexs.TANGENT);
	else if (_lc == "l") array_push(graphs[graphIdx][0], TokenIndexs.LOG);
	else if (_lc == "r") array_push(graphs[graphIdx][0], TokenIndexs.ROOT);
	else if (_lc == "p") array_push(graphs[graphIdx][0], TokenIndexs.PI);
	else if (_lc == "e") array_push(graphs[graphIdx][0], TokenIndexs.E);
	else if (_lc == ".") array_push(graphs[graphIdx][0], TokenIndexs.DECIMAL);
	else if (_lc == " ")
	{
		// Destroy current graph
		destroyGraph();
	}
	
	// Clear last character
	keyboard_lastchar = "";
	
	#endregion
	
	// Update blinking
	blinkTimer++;
	if (blinkTimer >= blinkFrequency)
	{
		cursor = !cursor;
		blinkTimer = 0;
	}
}

// If want to edit equation
if (getToggleEquationEditorInput()) 
{
	editingEquation = !editingEquation;
	
	// Reset variables
	if (editingEquation)
	{
		cursor = false;
		blinkTimer = 0;
		
		// Pause player/timer
		playerSpriteInstance = instance_create_layer(oPlayer.x,oPlayer.y,"Instances",oSprite);
		with (playerSpriteInstance)
		{
			// Setup player sprite placeholder
			sprite_index = oPlayer.sprite_index;
			image_index = oPlayer.image_index;
			image_xscale = oPlayer.image_xscale;
			image_blend = oPlayer.image_blend;
		}
		instance_deactivate_object(oPlayer);
		oWorld.gameTimerPaused = true;
		
		// Acid rain
		if (instance_exists(oAcidRain))
		{
			// Go through each acid rain and make a sprite instance for them, then deactivate them all
			with (oAcidRain)
			{
				var _spriteInstance = instance_create_layer(x, y, "BackgroundInstances", oSprite);
				with (_spriteInstance)
				{
					sprite_index = other.sprite_index;
					image_alpha = other.image_alpha;
				}
				array_push(other.acidRainSpriteInstances, _spriteInstance);
			}
			instance_deactivate_object(oAcidRain);
		}
	}
	else
	{
		cursor = true;
		
		// Reactivate player/timer
		if (playerSpriteInstance != noone) instance_destroy(playerSpriteInstance);
		instance_activate_object(oPlayer);
		if (array_length(acidRainSpriteInstances) > 0)
		{
			// Go through each acid rain and destroy the sprite instance, then reactivate them all
			while (array_length(acidRainSpriteInstances) > 0)
			{
				instance_destroy(array_pop(acidRainSpriteInstances));
			}
			instance_activate_object(oAcidRain);
		}
		oWorld.gameTimerPaused = false;
	}
}