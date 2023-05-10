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
previousPostfixEquation = "None";
graphCooldown = 300;

// Player
playerSpriteInstance = noone;

// Acid rain
acidRainSpriteInstances = [];

// Other
showInfo = true;
menuIdx = 0;

#region On-Screen Keyboard
showKeyboard = false;
keyboardX = TILE_SIZE + HALF_TILE_SIZE;
keyboardY = TILE_SIZE * 7 + HALF_TILE_SIZE;
keyboard = [
[TokenIndexs.NUM1,      TokenIndexs.NUM2,    TokenIndexs.NUM3,   TokenIndexs.NUM4,			   TokenIndexs.NUM5,			  TokenIndexs.NUM6, TokenIndexs.NUM7,  TokenIndexs.NUM8,	 TokenIndexs.NUM9],
[TokenIndexs.NUM0,	    TokenIndexs.DECIMAL, TokenIndexs.X,      TokenIndexs.OPEN_PARENTHESIS, TokenIndexs.CLOSE_PARENTHESIS, TokenIndexs.PLUS, TokenIndexs.MINUS, TokenIndexs.ASTERISK, TokenIndexs.SLASH],
[TokenIndexs.CARROT,    TokenIndexs.SINE,    TokenIndexs.COSINE, TokenIndexs.TANGENT,		   TokenIndexs.ROOT,			  TokenIndexs.LOG,  TokenIndexs.PI,	   TokenIndexs.E,		 TokenIndexs.SPACE],
[TokenIndexs.BACKSPACE, TokenIndexs.ENTER,   TokenIndexs.TAB,	 TokenIndexs.RIGHT,			   TokenIndexs.LEFT,			  TokenIndexs.DOWN, TokenIndexs.UP,	   TokenIndexs.SPACE,	 TokenIndexs.SPACE],
]
/// @func	oskeyboardCheck1();
oskeyboardCheck1 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck2();
oskeyboardCheck2 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck3();
oskeyboardCheck3 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 2, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck4();
oskeyboardCheck4 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 3, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck5();
oskeyboardCheck5 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 4, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck6();
oskeyboardCheck6 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 5, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck7();
oskeyboardCheck7 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 6, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck8();
oskeyboardCheck8 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 7, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck9();
oskeyboardCheck9 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 8, _bboxTop = keyboardY - HALF_TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheck0();
oskeyboardCheck0 = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckDecimal();
oskeyboardCheckDecimal = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckX();
oskeyboardCheckX = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 2, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckOpenParenthesis();
oskeyboardCheckOpenParenthesis = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 3, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckCloseParenthesis();
oskeyboardCheckCloseParenthesis = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 4, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckPlus();
oskeyboardCheckPlus = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 5, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckMinus();
oskeyboardCheckMinus = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 6, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckAsterisk();
oskeyboardCheckAsterisk = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 7, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckSlash();
oskeyboardCheckSlash = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 8, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckCarrot();
oskeyboardCheckCarrot = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckSin();
oskeyboardCheckSin = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckCos();
oskeyboardCheckCos = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 2, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckTan();
oskeyboardCheckTan = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 3, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckRoot();
oskeyboardCheckRoot = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 4, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckLog();
oskeyboardCheckLog = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 5, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckPi();
oskeyboardCheckPi = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 6, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckE();
oskeyboardCheckE = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 7, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckSpace();
oskeyboardCheckSpace = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 8, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 2;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckBackspace();
oskeyboardCheckBackspace = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckEnter();
oskeyboardCheckEnter = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckTab();
oskeyboardCheckTab = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 2, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (editingEquation && showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckRight();
oskeyboardCheckRight = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 3, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (editingEquation && showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckLeft();
oskeyboardCheckLeft = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 4, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (editingEquation && showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckDown();
oskeyboardCheckDown = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 5, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (editingEquation && showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
/// @func	oskeyboardCheckUp();
oskeyboardCheckUp = function()
{
	var _bboxLeft = keyboardX - HALF_TILE_SIZE + TILE_SIZE * 6, _bboxTop = keyboardY - HALF_TILE_SIZE + TILE_SIZE * 3;
	if (editingEquation && showKeyboard && mousePressed && mouse_x > _bboxLeft && mouse_x < _bboxLeft + TILE_SIZE && mouse_y > _bboxTop && mouse_y < _bboxTop + TILE_SIZE) return true
	return false;
}
#endregion

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
		
		// Apply cooldown on exit
		if (oWorld.gameStarted) graphs[graphIdx][3] = true;
		
		// Graph equation sound
		audio_play_sound(sfxGraphEquation, 3, false);
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
	return keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_start) || (mousePressed && mouse_y > 191) || oskeyboardCheckTab();
}

/// @func	getGraphEquationInput();
getGraphEquationInput = function()
{
	return keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face2) || oskeyboardCheckEnter();
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