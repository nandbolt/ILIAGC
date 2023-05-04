// If editing equation
if (editingEquation)
{
	#region Check Equation Inputs
	
	// Check last character
	var _lc = string_lower(keyboard_lastchar);
	if (getGraphEquationInput()) graphEquation();
	else if (_lc == "\b" && array_length(tokenIdxs) > 0) array_pop(tokenIdxs);
	else if (_lc == "0" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM0);
	else if (_lc == "1") array_push(tokenIdxs, TokenIndexs.NUM1);
	else if (_lc == "2") array_push(tokenIdxs, TokenIndexs.NUM2);
	else if (_lc == "3") array_push(tokenIdxs, TokenIndexs.NUM3);
	else if (_lc == "4") array_push(tokenIdxs, TokenIndexs.NUM4);
	else if (_lc == "5") array_push(tokenIdxs, TokenIndexs.NUM5);
	else if (_lc == "6" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM6);
	else if (_lc == "7") array_push(tokenIdxs, TokenIndexs.NUM7);
	else if (_lc == "8" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM8);
	else if (_lc == "9" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM9);
	else if (_lc == "x") array_push(tokenIdxs, TokenIndexs.X);
	else if (_lc == "+") array_push(tokenIdxs, TokenIndexs.PLUS);
	else if (_lc == "-") array_push(tokenIdxs, TokenIndexs.MINUS);
	else if (_lc = "*") array_push(tokenIdxs, TokenIndexs.ASTERISK);
	else if (_lc = "/") array_push(tokenIdxs, TokenIndexs.SLASH);
	else if (_lc = "^") array_push(tokenIdxs, TokenIndexs.CARROT);
	else if (_lc == "(") array_push(tokenIdxs, TokenIndexs.OPEN_PARENTHESIS);
	else if (_lc == ")") array_push(tokenIdxs, TokenIndexs.CLOSE_PARENTHESIS);
	else if (_lc == "s") array_push(tokenIdxs, TokenIndexs.SINE);
	else if (_lc == "c") array_push(tokenIdxs, TokenIndexs.COSINE);
	else if (_lc == "t") array_push(tokenIdxs, TokenIndexs.TANGENT);
	else if (_lc == "l") array_push(tokenIdxs, TokenIndexs.LOG);
	else if (_lc == "r") array_push(tokenIdxs, TokenIndexs.ROOT);
	else if (_lc == "p") array_push(tokenIdxs, TokenIndexs.PI);
	else if (_lc == "e") array_push(tokenIdxs, TokenIndexs.E);
	else if (_lc == ".") array_push(tokenIdxs, TokenIndexs.DECIMAL);
	else if (_lc == " ")
	{
		// Damage graphs
		with (oGraph)
		{
			damageGraph();
		}
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
		}
		instance_deactivate_object(oPlayer);
		oWorld.gameTimerPaused = true;
	}
	else
	{
		cursor = true;
		
		// Reactivate player/timer
		if (playerSpriteInstance != noone) instance_destroy(playerSpriteInstance);
		instance_activate_object(oPlayer);
		oWorld.gameTimerPaused = false;
	}
}