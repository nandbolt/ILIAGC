// Input
mousePressed = mouse_check_button_pressed(mb_left);

// If game started and timer not paused
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Decrement graph cooldowns
	with (oGrapher)
	{
		for (var _i = 0; _i < array_length(graphs); _i++)
		{
			if (graphs[_i][2] > 0) graphs[_i][2]--;
		}
	}
}

// If editing equation
if (editingEquation)
{
	// Toggle info
	if (keyboard_check_pressed(ord("H")))
	{
		showInfo = !showInfo;
	}
	else if (keyboard_check_pressed(vk_up) || oskeyboardCheckUp())
	{
		// Toggle previous graph
		if (graphIdx == 0) graphIdx = array_length(graphs) - 1;
		else graphIdx--;
		
		// Update equation tokens
		equationTokens = [];
		array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
	}
	else if (keyboard_check_pressed(vk_down) || oskeyboardCheckDown())
	{
		// Toggle next graph
		if (graphIdx == array_length(graphs) - 1) graphIdx = 0;
		else graphIdx++;
		
		// Update equation tokens
		equationTokens = [];
		array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
	}
	else if (keyboard_check_pressed(vk_left) || oskeyboardCheckLeft())
	{
		// Toggle next menu
		if (menuIdx == 0) menuIdx = 2;
		else menuIdx--;
	}
	else if (keyboard_check_pressed(vk_right) || oskeyboardCheckRight())
	{
		// Toggle next menu
		if (menuIdx == 2) menuIdx = 0;
		else menuIdx++;
	}
	
	#region Check Equation Inputs
	
	// Check last character
	var _lc = string_lower(keyboard_lastchar);
	if (getGraphEquationInput()) graphEquation();
	else if ((_lc == "\b" || oskeyboardCheckBackspace()) && array_length(equationTokens) > 0) array_pop(equationTokens);
	else if ((_lc == "0" && !keyboard_check(vk_shift)) || oskeyboardCheck0()) array_push(equationTokens, TokenIndexs.NUM0);
	else if (_lc == "1" || oskeyboardCheck1()) array_push(equationTokens, TokenIndexs.NUM1);
	else if (_lc == "2" || oskeyboardCheck2()) array_push(equationTokens, TokenIndexs.NUM2);
	else if (_lc == "3" || oskeyboardCheck3()) array_push(equationTokens, TokenIndexs.NUM3);
	else if (_lc == "4" || oskeyboardCheck4()) array_push(equationTokens, TokenIndexs.NUM4);
	else if (_lc == "5" || oskeyboardCheck5()) array_push(equationTokens, TokenIndexs.NUM5);
	else if ((_lc == "6" && !keyboard_check(vk_shift)) || oskeyboardCheck6()) array_push(equationTokens, TokenIndexs.NUM6);
	else if (_lc == "7"  || oskeyboardCheck7()) array_push(equationTokens, TokenIndexs.NUM7);
	else if ((_lc == "8" && !keyboard_check(vk_shift)) || oskeyboardCheck8()) array_push(equationTokens, TokenIndexs.NUM8);
	else if ((_lc == "9" && !keyboard_check(vk_shift)) || oskeyboardCheck9()) array_push(equationTokens, TokenIndexs.NUM9);
	else if (_lc == "x" || oskeyboardCheckX()) array_push(equationTokens, TokenIndexs.X);
	else if (_lc == "+" || oskeyboardCheckPlus()) array_push(equationTokens, TokenIndexs.PLUS);
	else if (_lc == "-" || oskeyboardCheckMinus()) array_push(equationTokens, TokenIndexs.MINUS);
	else if (_lc = "*" || oskeyboardCheckAsterisk()) array_push(equationTokens, TokenIndexs.ASTERISK);
	else if (_lc = "/" || oskeyboardCheckSlash()) array_push(equationTokens, TokenIndexs.SLASH);
	else if (_lc = "^" || oskeyboardCheckCarrot()) array_push(equationTokens, TokenIndexs.CARROT);
	else if (_lc == "(" || oskeyboardCheckOpenParenthesis()) array_push(equationTokens, TokenIndexs.OPEN_PARENTHESIS);
	else if (_lc == ")" || oskeyboardCheckCloseParenthesis()) array_push(equationTokens, TokenIndexs.CLOSE_PARENTHESIS);
	else if (_lc == "s" || oskeyboardCheckSin()) array_push(equationTokens, TokenIndexs.SINE);
	else if (_lc == "c" || oskeyboardCheckCos()) array_push(equationTokens, TokenIndexs.COSINE);
	else if (_lc == "t" || oskeyboardCheckTan()) array_push(equationTokens, TokenIndexs.TANGENT);
	else if (_lc == "l" || oskeyboardCheckLog()) array_push(equationTokens, TokenIndexs.LOG);
	else if (_lc == "r" || oskeyboardCheckRoot()) array_push(equationTokens, TokenIndexs.ROOT);
	else if (_lc == "p" || oskeyboardCheckPi()) array_push(equationTokens, TokenIndexs.PI);
	else if (_lc == "e" || oskeyboardCheckE()) array_push(equationTokens, TokenIndexs.E);
	else if (_lc == "." || oskeyboardCheckDecimal()) array_push(equationTokens, TokenIndexs.DECIMAL);
	else if (_lc == " " || oskeyboardCheckSpace())
	{
		// Destroy current graph
		destroyGraph();
		
		// Clear equations
		equationTokens = [];
		graphs[graphIdx][0] = [];
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
	
	// Update equation tokens
	equationTokens = [];
	array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
	
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
		
		// Apply cooldowns
		for (var _i = 0; _i < array_length(graphs); _i++)
		{
			// Apply cooldown on exit
			if (graphs[graphIdx][3])
			{
				graphs[graphIdx][2] = graphCooldown;
				graphs[graphIdx][3] = false;
			}
		}
	}
}