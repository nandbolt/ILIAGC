// State
editingEquation = false;

// Equation cursor
cursor = false;
blinkTimer = 0;
blinkFrequency = 20;

// Graphs + equations
graphs = [[[], noone, 0], [[], noone, 0]];	// Per graph: [0]token indexs for equation, [1]graph instance, [2]cooldown
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
previousPostfixEquation = "None";
graphCooldown = 5;	// Seconds

// Player
playerSpriteInstance = noone;

// Acid rain
acidRainSpriteInstances = [];

// Other
showInfo = true;

/// @func	graphEquation();
graphEquation = function()
{
	// Set graph equation
	graphs[graphIdx][0] = [];
	array_copy(graphs[graphIdx][0], 0, equationTokens, 0, array_length(equationTokens));
	
	// Exit function if graph on cooldown
	if (graphs[graphIdx][2] > 0)
	{
		previousPostfixEquation = "Cooldown ends in " + string(graphs[graphIdx][2]);
		return;
	}
	
	// Check expression validity
	var _expression = simplifyExpression(graphs[graphIdx][0]);
	if (validExpression(_expression))
	{
		// Get postfix expression
		var _postfixExpression = convertInfixToPostfix(_expression);
		previousPostfixEquation = "";
		for (var _i = 0; _i < array_length(_postfixExpression); _i++)
		{
			previousPostfixEquation += _postfixExpression[_i] + " ";
		}
		
		// Destroy current graph
		destroyGraph();
	
		// Create graph (at origin) and set to current
		graphs[graphIdx][1] = instance_create_layer(16,176,"Instances",oGraph);
		with (graphs[graphIdx][1])
		{
			// Create expression tree
			createExpressionTree(_postfixExpression);
			
			// Set idx
			graphIdx = other.graphIdx;
		}
		
		// Set cooldown
		if (oWorld.gameStarted) graphs[graphIdx][2] = graphCooldown;
	}
	else previousPostfixEquation = "Invalid EQ";
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
	if (array_length(_expression) == 0) return false;
	
	// Parenthesis check
	var _psum = 0;
	for (var _i = 0; _i < array_length(_expression); _i++)
	{
		if (_expression[_i] == "(") _psum++;
		else if (_expression[_i] == ")") _psum--;
		if (_psum < 0) return false;
	}
	if (_psum != 0) return false;
	
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

/// @func	getToggleEquationEditorInput();
getToggleEquationEditorInput = function()
{
	return keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_start);
}

/// @func	getGraphEquationInput();
getGraphEquationInput = function()
{
	return keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face2);
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