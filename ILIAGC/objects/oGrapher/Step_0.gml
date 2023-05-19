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
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_up))
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
	else if (keyboard_check_pressed(vk_down))
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
	else if (keyboard_check_pressed(vk_left))
	{
		// Toggle next menu
		if (menuIdx == 0) menuIdx = menuCount;
		else menuIdx--;
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Key sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
	else if (keyboard_check_pressed(vk_right))
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
	if (inputPressed(0, InputAction.INTERACT)) graphEquation();
	else if ((_lc == "\b") && array_length(equationTokens) > 0) removeEquationToken();
	else if ((_lc == "0" && !keyboard_check(vk_shift))) addEquationToken(TokenIndexs.NUM0);
	else if (_lc == "1") addEquationToken(TokenIndexs.NUM1);
	else if (_lc == "2") addEquationToken(TokenIndexs.NUM2);
	else if (_lc == "3") addEquationToken(TokenIndexs.NUM3);
	else if (_lc == "4") addEquationToken(TokenIndexs.NUM4);
	else if (_lc == "5") addEquationToken(TokenIndexs.NUM5);
	else if ((_lc == "6" && !keyboard_check(vk_shift))) addEquationToken(TokenIndexs.NUM6);
	else if (_lc == "7") addEquationToken(TokenIndexs.NUM7);
	else if ((_lc == "8" && !keyboard_check(vk_shift))) addEquationToken(TokenIndexs.NUM8);
	else if ((_lc == "9" && !keyboard_check(vk_shift))) addEquationToken(TokenIndexs.NUM9);
	else if (_lc == "x") addEquationToken(TokenIndexs.X);
	else if (_lc == "+") addEquationToken(TokenIndexs.PLUS);
	else if (_lc == "-") addEquationToken(TokenIndexs.MINUS);
	else if (_lc = "*") addEquationToken(TokenIndexs.ASTERISK);
	else if (_lc = "/") addEquationToken(TokenIndexs.SLASH);
	else if (_lc = "^") addEquationToken(TokenIndexs.CARROT);
	else if (_lc == "(") addEquationToken(TokenIndexs.OPEN_PARENTHESIS);
	else if (_lc == ")") addEquationToken(TokenIndexs.CLOSE_PARENTHESIS);
	else if (_lc == "s") addEquationToken(TokenIndexs.SINE);
	else if (_lc == "c") addEquationToken(TokenIndexs.COSINE);
	else if (_lc == "t") addEquationToken(TokenIndexs.TANGENT);
	else if (_lc == "l") addEquationToken(TokenIndexs.LOG);
	else if (_lc == "r") addEquationToken(TokenIndexs.ROOT);
	else if (_lc == "p") addEquationToken(TokenIndexs.PI);
	else if (_lc == "e") addEquationToken(TokenIndexs.E);
	else if (_lc == ".") addEquationToken(TokenIndexs.DECIMAL);
	else if (_lc == " ")
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
if (inputPressed(0, InputAction.SELECT)) toggleEquationEditor();