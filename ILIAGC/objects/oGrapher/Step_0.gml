// If editing equation
if (editingEquation)
{
	#region Check Equation Inputs
	
	// Check last character
	if (keyboard_check_pressed(vk_enter)) graphEquation();
	else if (keyboard_lastchar == "\b" && array_length(tokenIdxs) > 0) array_pop(tokenIdxs);
	else if (keyboard_lastchar == "0" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM0);
	else if (keyboard_lastchar == "1") array_push(tokenIdxs, TokenIndexs.NUM1);
	else if (keyboard_lastchar == "2") array_push(tokenIdxs, TokenIndexs.NUM2);
	else if (keyboard_lastchar == "3") array_push(tokenIdxs, TokenIndexs.NUM3);
	else if (keyboard_lastchar == "4") array_push(tokenIdxs, TokenIndexs.NUM4);
	else if (keyboard_lastchar == "5") array_push(tokenIdxs, TokenIndexs.NUM5);
	else if (keyboard_lastchar == "6" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM6);
	else if (keyboard_lastchar == "7") array_push(tokenIdxs, TokenIndexs.NUM7);
	else if (keyboard_lastchar == "8" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM8);
	else if (keyboard_lastchar == "9" && !keyboard_check(vk_shift)) array_push(tokenIdxs, TokenIndexs.NUM9);
	else if (keyboard_lastchar == "x") array_push(tokenIdxs, TokenIndexs.X);
	else if (keyboard_lastchar == "+") array_push(tokenIdxs, TokenIndexs.PLUS);
	else if (keyboard_lastchar == "-") array_push(tokenIdxs, TokenIndexs.MINUS);
	else if (keyboard_lastchar = "*") array_push(tokenIdxs, TokenIndexs.ASTERISK);
	else if (keyboard_lastchar = "/") array_push(tokenIdxs, TokenIndexs.SLASH);
	else if (keyboard_lastchar = "^") array_push(tokenIdxs, TokenIndexs.CARROT);
	else if (keyboard_lastchar == "(") array_push(tokenIdxs, TokenIndexs.OPEN_PARENTHESIS);
	else if (keyboard_lastchar == ")") array_push(tokenIdxs, TokenIndexs.CLOSE_PARENTHESIS);
	else if (keyboard_lastchar == "s") array_push(tokenIdxs, TokenIndexs.SINE);
	else if (keyboard_lastchar == "c") array_push(tokenIdxs, TokenIndexs.COSINE);
	else if (keyboard_lastchar == "t") array_push(tokenIdxs, TokenIndexs.TANGENT);
	else if (keyboard_lastchar == "l") array_push(tokenIdxs, TokenIndexs.LOG);
	else if (keyboard_lastchar == "r") array_push(tokenIdxs, TokenIndexs.ROOT);
	else if (keyboard_lastchar == "p") array_push(tokenIdxs, TokenIndexs.PI);
	else if (keyboard_lastchar == "e") array_push(tokenIdxs, TokenIndexs.E);
	
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
if (keyboard_check_pressed(vk_tab)) 
{
	editingEquation = !editingEquation;
	
	// Reset variables
	if (editingEquation)
	{
		cursor = false;
		blinkTimer = 0;
		
		// Pause player/timer
		var _playerSprite = instance_create_layer(oPlayer.x,oPlayer.y,"Instances",oSprite);
		with (_playerSprite)
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
		instance_destroy(oSprite);
		instance_activate_object(oPlayer);
		oWorld.gameTimerPaused = false;
	}
}