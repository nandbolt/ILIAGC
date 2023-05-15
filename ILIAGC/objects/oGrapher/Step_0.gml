// Input
mousePressed = mouse_check_button_pressed(mb_left);

// If game started and timer not paused
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Iron graph timer
	if (ironGraphTimer > 0) ironGraphTimer--; 
	
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
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_up) || oskeyboardCheckUp())
	{
		// Toggle previous graph
		if (graphIdx == 0) graphIdx = array_length(graphs) - 1;
		else graphIdx--;
		
		// Update equation tokens
		equationTokens = [];
		array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_down) || oskeyboardCheckDown())
	{
		// Toggle next graph
		if (graphIdx == array_length(graphs) - 1) graphIdx = 0;
		else graphIdx++;
		
		// Update equation tokens
		equationTokens = [];
		array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_left) || oskeyboardCheckLeft())
	{
		// Toggle next menu
		if (menuIdx == 0) menuIdx = menuCount;
		else menuIdx--;
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_right) || oskeyboardCheckRight())
	{
		// Toggle next menu
		if (menuIdx == menuCount) menuIdx = 0;
		else menuIdx++;
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	
	#region Check Equation Inputs
	
	// Check last character
	var _lc = string_lower(keyboard_lastchar);
	if (getGraphEquationInput()) graphEquation();
	else if ((_lc == "\b" || oskeyboardCheckBackspace()) && array_length(equationTokens) > 0) removeEquationToken();
	else if ((_lc == "0" && !keyboard_check(vk_shift)) || oskeyboardCheck0()) addEquationToken(TokenIndexs.NUM0);
	else if (_lc == "1" || oskeyboardCheck1()) addEquationToken(TokenIndexs.NUM1);
	else if (_lc == "2" || oskeyboardCheck2()) addEquationToken(TokenIndexs.NUM2);
	else if (_lc == "3" || oskeyboardCheck3()) addEquationToken(TokenIndexs.NUM3);
	else if (_lc == "4" || oskeyboardCheck4()) addEquationToken(TokenIndexs.NUM4);
	else if (_lc == "5" || oskeyboardCheck5()) addEquationToken(TokenIndexs.NUM5);
	else if ((_lc == "6" && !keyboard_check(vk_shift)) || oskeyboardCheck6()) addEquationToken(TokenIndexs.NUM6);
	else if (_lc == "7"  || oskeyboardCheck7()) addEquationToken(TokenIndexs.NUM7);
	else if ((_lc == "8" && !keyboard_check(vk_shift)) || oskeyboardCheck8()) addEquationToken(TokenIndexs.NUM8);
	else if ((_lc == "9" && !keyboard_check(vk_shift)) || oskeyboardCheck9()) addEquationToken(TokenIndexs.NUM9);
	else if (_lc == "x" || oskeyboardCheckX()) addEquationToken(TokenIndexs.X);
	else if (_lc == "+" || oskeyboardCheckPlus()) addEquationToken(TokenIndexs.PLUS);
	else if (_lc == "-" || oskeyboardCheckMinus()) addEquationToken(TokenIndexs.MINUS);
	else if (_lc = "*" || oskeyboardCheckAsterisk()) addEquationToken(TokenIndexs.ASTERISK);
	else if (_lc = "/" || oskeyboardCheckSlash()) addEquationToken(TokenIndexs.SLASH);
	else if (_lc = "^" || oskeyboardCheckCarrot()) addEquationToken(TokenIndexs.CARROT);
	else if (_lc == "(" || oskeyboardCheckOpenParenthesis()) addEquationToken(TokenIndexs.OPEN_PARENTHESIS);
	else if (_lc == ")" || oskeyboardCheckCloseParenthesis()) addEquationToken(TokenIndexs.CLOSE_PARENTHESIS);
	else if (_lc == "s" || oskeyboardCheckSin()) addEquationToken(TokenIndexs.SINE);
	else if (_lc == "c" || oskeyboardCheckCos()) addEquationToken(TokenIndexs.COSINE);
	else if (_lc == "t" || oskeyboardCheckTan()) addEquationToken(TokenIndexs.TANGENT);
	else if (_lc == "l" || oskeyboardCheckLog()) addEquationToken(TokenIndexs.LOG);
	else if (_lc == "r" || oskeyboardCheckRoot()) addEquationToken(TokenIndexs.ROOT);
	else if (_lc == "p" || oskeyboardCheckPi()) addEquationToken(TokenIndexs.PI);
	else if (_lc == "e" || oskeyboardCheckE()) addEquationToken(TokenIndexs.E);
	else if (_lc == "." || oskeyboardCheckDecimal()) addEquationToken(TokenIndexs.DECIMAL);
	else if (_lc == " " || oskeyboardCheckSpace())
	{
		// Destroy current graph
		destroyGraph();
		
		// Clear equations
		equationTokens = [];
		graphs[graphIdx][0] = [];
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
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
		// Pause game
		with (oGame)
		{
			pauseGame();
		}
		
		// Set type cursor
		cursor = false;
		blinkTimer = 0;
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Show cooldown if applicable
		if (graphs[graphIdx][2] > 0) previousPostfixEquation = "Cooldown ends in " + string(graphs[graphIdx][2] / 60) + " seconds";
		else if (string_length(previousPostfixEquation) > 0 && string_char_at(previousPostfixEquation, 0) == "C") previousPostfixEquation = "None";
	}
	else
	{
		// Set cursor
		cursor = true;
		
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
		
		// Resume game
		with (oGame)
		{
			resumeGame();
		}
	}
	
	// Toggle grapher sound
	audio_play_sound(sfxToggleGrapher, 2, false);
}