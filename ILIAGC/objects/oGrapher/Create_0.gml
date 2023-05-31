// State
editingEquation = false;

// Input
mousePressed = false;

// Equation cursor
cursor = false;
blinkTimer = 0;
blinkFrequency = 20;

// Graphs + equations
graphs = [[[], noone, 0, false], [[], noone, 0, false]];	// Per graph: [0]token indexs for equation, [1]graph instance, [2]cooldown, [3]apply cooldown
graphIdx = 0;
equationTokens = [];
precedenceMap = ds_map_create();
ds_map_add(precedenceMap, "(", 1);
ds_map_add(precedenceMap, "+", 2);
ds_map_add(precedenceMap, "-", 2);
ds_map_add(precedenceMap, "*", 3);
ds_map_add(precedenceMap, "/", 3);
ds_map_add(precedenceMap, "s", 3);
ds_map_add(precedenceMap, "c", 3);
ds_map_add(precedenceMap, "t", 3);
ds_map_add(precedenceMap, "^", 4);
ds_map_add(precedenceMap, "l", 5);
ds_map_add(precedenceMap, "r", 5);
graphCooldown = 300;
axisVisible = layer_get_visible("GridAxis");
graphNote = "";

// Other
showInfo = true;
menuIdx = 0;
menuCount = 4;

#region Powerups

// Iron graph
ironGraphs = 0;

#endregion

// Table
table = [0,0,0,0,0,0,0,0,0,0];

/// @func	graphEquation();
graphEquation = function()
{
	// Exit function if graph on cooldown
	if (graphs[graphIdx][2] > 0)
	{
		graphNote = "Equation y" + string(graphIdx + 1) + " on cooldown."
		return;
	}
	
	// Check expression validity
	var _expression = simplifyExpression(equationTokens);
	if (validExpression(_expression))
	{
		// Set graph equation
		graphs[graphIdx][0] = [];
		array_copy(graphs[graphIdx][0], 0, equationTokens, 0, array_length(equationTokens));
		
		// Get postfix expression
		var _postfixExpression = convertInfixToPostfix(_expression);
		
		// Destroy current graph
		destroyGraph();
	
		// Create graph (at origin) and set to current
		graphs[graphIdx][1] = instance_create_layer(16,176,"BackgroundInstances",oGraph);
		with (graphs[graphIdx][1])
		{
			// Create expression tree
			createExpressionTree(_postfixExpression);
			
			// Set info
			graphIdx = other.graphIdx;
			
			// If iron graph
			if (other.ironGraphs > 0)
			{
				setIronGraph();
				other.ironGraphs--;
			}
			
			// Set postfix expression
			for (var _i = 0; _i < array_length(_postfixExpression); _i++)
			{
				postfixEquation += _postfixExpression[_i] + " ";
			}
		}
		
		// Apply cooldown on exit
		if (oWorld.gameStarted) graphs[graphIdx][3] = true;
		
		// Fill table if necessary
		if (menuIdx == 3) fillTable();
		
		// Clear graph note
		graphNote = "";
		
		// Graph equation sound
		audio_play_sound(sfxGraphEquation, 3, false);
	}
	else
	{
		// Graph equation sound
		audio_play_sound(sfxHurt, 1, false);
	}
}

/// @func	simplifyExpression({array} tokenIdxs);
simplifyExpression = function(_tokenIdxs)
{
	var _expression = [];
	
	for (var _i = 0; _i < array_length(_tokenIdxs); _i++)
	{
		var _tokenIdx = _tokenIdxs[_i];
		
		// If number or decimal
		if (tokenIsNumber(_tokenIdx) || _tokenIdx == TokenIndexs.DECIMAL)
		{
			// Construct number string, add to expression
			var _numString = convertTokenIndexToString(_tokenIdx);
			var _j = 1;
			while (_i + _j < array_length(_tokenIdxs))
			{
				var _nextTokenIdx = _tokenIdxs[_i + _j];
				if (tokenIsNumber(_nextTokenIdx) || _nextTokenIdx == TokenIndexs.DECIMAL) _numString += convertTokenIndexToString(_nextTokenIdx);
				else break;
				_j++;
			}
			array_push(_expression, _numString);
			_i += _j - 1;
		}
		else
		{
			// Trig
			if (tokenIsTrigOperator(_tokenIdx) && (_i == 0 || tokenIsOperator(_tokenIdxs[_i - 1]) || _tokenIdxs[_i - 1] == TokenIndexs.OPEN_PARENTHESIS))
			{
				// Add implied 1 to trig operator
				array_push(_expression, "1");
			}
			// Log
			else if (_tokenIdx == TokenIndexs.LOG && (_i == 0 || tokenIsOperator(_tokenIdxs[_i - 1])))
			{
				// Add log base 10
				array_push(_expression, "10");
			}
			// Root
			else if (_tokenIdx == TokenIndexs.ROOT && (_i == 0 || tokenIsOperator(_tokenIdxs[_i - 1])))
			{
				// Add square root
				array_push(_expression, "2");
			}
			// Negative
			else if (_tokenIdx == TokenIndexs.MINUS && (_i == 0 || tokenIsOperator(_tokenIdxs[_i - 1]) || _tokenIdxs[_i - 1] == TokenIndexs.OPEN_PARENTHESIS))
			{
				// Add implied 0
				array_push(_expression, "0");
			}
			array_push(_expression, convertTokenIndexToString(_tokenIdx));
		}
		
		// If constant, not last index and touching x, pi, e, or open parenthesis
		if ((tokenIsConstant(_tokenIdx) || _tokenIdx == TokenIndexs.DECIMAL) && _i < array_length(_tokenIdxs) - 1 &&
			(_tokenIdxs[_i + 1] == TokenIndexs.X || _tokenIdxs[_i + 1] == TokenIndexs.PI || _tokenIdxs[_i + 1] == TokenIndexs.E ||
			 _tokenIdxs[_i + 1] == TokenIndexs.OPEN_PARENTHESIS))
		{
			// Add multiplication
			array_push(_expression, "*");
		}
	}
	
	// Single character expression (add + 0)
	if (array_length(_expression) == 1) array_push(_expression, "+", "0");
	
	return _expression;
}

/// @func	validExpression({array} expression);
validExpression = function(_expression)
{
	// Empty check 
	if (array_length(_expression) == 0)
	{
		graphNote = "No equation inputted.";
		return false;
	}
	
	// Token check
	var _psum = 0;						// Parenthesis must sum to 0
	var _parenthesisEmpty = false;		// Parenthesis must enclose something
	var _hasValue = false;
	for (var _i = 0; _i < array_length(_expression); _i++)
	{
		// Open parenthesis
		if (_expression[_i] == "(")
		{
			_psum++;
			_parenthesisEmpty = true;
		}
		// Closing parenthesis
		else if (_expression[_i] == ")")
		{
			if (_parenthesisEmpty)
			{
				graphNote = "Parenthesis error: Empty parenthesis somewhere.";
				return false;
			}
			_psum--;
		}
		else
		{
			// If has no value yet
			if (!_hasValue && (_expression[_i] == "x" || tokenStringIsConstant(_expression[_i]))) _hasValue = true;
			
			// Reset empty parenthesis
			_parenthesisEmpty = false;
		}
		
		// If closing parenthesis without opening first parenthesis
		if (_psum < 0)
		{
			graphNote = "Parenthesis error: Incorrect parenthesis order.";
			return false;
		}
	}
	
	// Parenthesis sum check
	if (_psum != 0)
	{
		graphNote = "Parenthesis error: Missing a parenthesis somewhere.";
		return false;
	}
	
	// Value check
	if (!_hasValue)
	{
		graphNote = "Equation must have at least one constant or variable.";
		return false;
	}
	
	return true;
}

/// @func	convertInfixToPostfix({array} expression);
convertInfixToPostfix = function(_expression)
{
	var _postfixExpression = [];
	var _operatorStack = ds_stack_create();
	
	// Scan infix expression
	for (var _i = 0; _i < array_length(_expression); _i++)
	{
		// Get token
		var _token = _expression[_i];
		var _isOperator = tokenStringIsOperator(_token);
		
		// Append token to stack if operand
		if (!_isOperator && _token != "(" && _token != ")") array_push(_postfixExpression, _token);
		// Push onto stack if left parenthesis
		else if (_token == "(") ds_stack_push(_operatorStack, _token);
		// Pop stack until corresponding left parenthesis is removed, append each operator to end of output list
		else if (_token == ")")
		{
			var _topToken = ds_stack_pop(_operatorStack);
			while (_topToken != "(")
			{
				array_push(_postfixExpression, _topToken);
				_topToken = ds_stack_pop(_operatorStack);
			}
		}
		// Else token is operator
		else
		{
			// Remove any operators already in stack that have higher or equal precedence and append them to output list, then push token to stack
			while (!ds_stack_empty(_operatorStack) && (precedenceMap[? ds_stack_top(_operatorStack)] >= precedenceMap[? _token]))
			{
				array_push(_postfixExpression, ds_stack_pop(_operatorStack));
			}
			ds_stack_push(_operatorStack, _token)
		}
	}
	
	// Add remaining operators on stack to output list
	while (!ds_stack_empty(_operatorStack)) array_push(_postfixExpression, ds_stack_pop(_operatorStack));
	
	ds_stack_destroy(_operatorStack);
	return _postfixExpression;
}

/// @func	destroyGraph();
destroyGraph = function()
{
	// If current graph is not noone
	if (graphs[graphIdx][1] != noone)
	{
		// Destroy graph if it exists, then set to noone
		if (instance_exists(graphs[graphIdx][1])) instance_destroy(graphs[graphIdx][1]);
		graphs[graphIdx][1] = noone;
	}
}

/// @func	addEquationToken({int} tokenIdx);
addEquationToken = function(_tokenIdx)
{
	// Add to array
	array_push(equationTokens, _tokenIdx);
	
	// Key sound
	if (_tokenIdx == TokenIndexs.X) audio_play_sound(sfxVariablePressed, 1, false);
	else if (tokenIsOperator(_tokenIdx)) audio_play_sound(sfxOperatorPressed, 1, false);
	else audio_play_sound(sfxConstantPressed, 1, false);
}

/// @func	removeEquationToken();
removeEquationToken = function()
{
	// Pop off array
	array_pop(equationTokens)
	
	// Key sound
	audio_play_sound(sfxBackspacePressed, 1, false);
}

/// @func fillTable();
fillTable = function()
{
	// If current graph exists
	if (instance_exists(graphs[graphIdx][1]))
	{
		with (graphs[graphIdx][1])
		{
			for (var _i = 0; _i < 10; _i++)
			{
				other.table[_i] = getGraphOutput(_i);
			}
		}
	}
	// Clear table
	else for (var _i = 0; _i < array_length(table); _i++) table[_i] = 0;
}

/// @func	toggleEquationEditor();
toggleEquationEditor = function()
{
	// Toggle editing equation
	editingEquation = !editingEquation;
	
	// Update equation tokens
	equationTokens = [];
	array_copy(equationTokens, 0, graphs[graphIdx][0], 0, array_length(graphs[graphIdx][0]));
	
	// Reset variables
	if (editingEquation) onToggleEquationEditorOn();
	else onToggleEquationEditorOff();
}

/// @func	onToggleEquationEditorOn();
onToggleEquationEditorOn = function()
{
	// If game not paused
	if (!oGame.gamePaused)
	{
		// Pause game
		with (oGame)
		{
			pauseGame();
		}
	}
	// Else destroy pause menu if it exists
	else if (instance_exists(oPauseMenu)) instance_destroy(oPauseMenu);
	
	// Set type cursor
	cursor = false;
	blinkTimer = 0;
		
	// Fill table if necessary
	if (menuIdx == 3) fillTable();
	
	// Spawn on screen keyboard if real one not being used
	if (oInput.playerGamepadIds[| 0] != -1 || os_type == os_android) instance_create_layer(0, 0, "Instances", oOnScreenKeyboard);
	
	// Storge previous axis visibility
	axisVisible = layer_get_visible("GridAxis");
	
	// Set axis visible
	layer_set_visible("GridNumbers", true);
	layer_set_visible("GridNumberBackgrounds", true);
	layer_set_visible("GridAxis", true);
	
	// Clear graph note
	graphNote = "";
}

/// @func	onToggleEquationEditorOff();
onToggleEquationEditorOff = function()
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
	
	// Destroy on screen keyboard if one exists
	if (instance_exists(oOnScreenKeyboard)) instance_destroy(oOnScreenKeyboard);
	
	// Set axis visibility to previous
	layer_set_visible("GridNumbers", axisVisible);
	layer_set_visible("GridNumberBackgrounds", axisVisible);
	layer_set_visible("GridAxis", axisVisible);
		
	// Resume game
	with (oGame)
	{
		resumeGame();
	}
}

// Add upgrade if toggled
ini_open("save.ini");
if (ini_read_real("inventory", getUpgradeSaveName(Upgrade.EQUATION_UP), 0) > 0) setUpgrade(Upgrade.EQUATION_UP);
ini_close();