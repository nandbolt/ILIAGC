// Color
normalGraphColor = c_white;

// Graph
graphOrigin = new Vector2(convertXToGraphX(x),convertYToGraphY(y));
graphPath = path_add();
graphIdx = 0;
if (oWorld.currentTheme == Theme.NEOKYO_CITY)
{
	graphSegment = sNeonGraphSegment;
	var _num = irandom(5);
	switch (_num)
	{
		// Argon
		case 0:
			normalGraphColor = c_fuchsia;
			break;
		// Helium
		case 1:
			normalGraphColor = make_color_rgb(255, 83, 73);
			break;
		// Krypton
		case 2:
			normalGraphColor = make_color_rgb(137, 207, 240);
			break;
		// Radon
		case 3:
			normalGraphColor = make_color_rgb(255, 165, 0);
			break;
		// Xenon
		case 4:
			normalGraphColor = make_color_rgb(92, 43, 226);
			break;
		// Neon
		default:
			normalGraphColor = c_red;
	}
}
else graphSegment = sGraphSegment;

// Equation
expressionTree = new Tree();

// Draw
drawTime = 30;
drawCounter = 0;

// Iron
ironGraph = false;

// Vertical asymptote
verticalAsymptoteValue = 10;	// -infinity -> +infinity, with this value essentially taking place of infinity

/// @func	createExpressionTree({array} _postfixExpression);
createExpressionTree = function(_postfixExpression)
{	
	// Create stack/init current node
	var _nodeStack = ds_stack_create();
	
	// Loop through expression
	for (var _i = 0; _i < array_length(_postfixExpression); _i++)
	{
		// Get token
		var _token = _postfixExpression[_i];
		
		// If not an operator
		if (!tokenStringIsOperator(_token))
		{
			// Convert token to value
			var _value = 0;
			if (_token == "x") _value = "x";
			else if (_token == "p") _value = pi;
			else if (_token == "e") _value = 2.72;
			else _value = real(_token);
			ds_stack_push(_nodeStack, new TreeNode(_value));
		}
		else
		{
			var _right = ds_stack_pop(_nodeStack);
			var _left = ds_stack_pop(_nodeStack);
			var _newNode = new TreeNode(_token, _left, _right);
			ds_stack_push(_nodeStack, _newNode);
		}
	}
	
	// Set root
	expressionTree.root = ds_stack_pop(_nodeStack);
	
	// Destroy stack
	ds_stack_destroy(_nodeStack);
	
	// Create graph path
	createGraphPath();
}

/// @func	createGraphPath();
createGraphPath = function()
{
	// Loop through domain (x {0,10})
	for (var _gx = 0; _gx <= 10; _gx += 0.1)
	{
		// Get graph output
		var _gy = getGraphOutput(_gx);
		
		// Convert graph position to real position
		var _x = convertGraphXToX(_gx), _y = convertGraphYToY(_gy);
		
		// Add to graph path
		path_add_point(graphPath,_x,_y,100);
	}
}

/// @func	evaluateExpression({real} input, {TreeNode} node);
/// Returns the evaluation of the expression tree from the given node and input [x = input, y = output]
evaluateExpression = function(_input, _node)
{
	// Return 0 if empty node
	if (_node == noone) return 0;
	
	// Return node data if real number
	if (is_real(_node.data)) return _node.data;
	
	// Return input if x
	if (_node.data == "x") return _input;
	
	// Get values
	var _leftValue = evaluateExpression(_input, _node.leftChild);
	var _rightValue = evaluateExpression(_input, _node.rightChild);
	var _value = 0;
	
	// Operators
	if (_node.data == "+") _value += _leftValue + _rightValue;
	else if (_node.data == "-") _value += _leftValue - _rightValue;
	else if (_node.data == "*") _value += _leftValue * _rightValue;
	else if (_node.data == "/")
	{
		// Account for divide by zero error
		if (_rightValue == 0) _rightValue = 0.01;
		_value += _leftValue / _rightValue;
	}
	else if (_node.data == "^")
	{
		// Apparently left value can't be negative
		var _power = power(_leftValue * sign(_leftValue), _rightValue);
		_value += _power;
	}
	else if (_node.data == "s") _value += _leftValue * sin(_rightValue);
	else if (_node.data == "c") _value += _leftValue * cos(_rightValue);
	else if (_node.data == "t")
	{
		// Account for divide by zero error
		var _cosine = cos(_rightValue);
		if (_cosine == 0) _cosine = 0.01;
		_value += _leftValue * (sin(_rightValue) / _cosine);
	}
	else if (_node.data == "l")
	{
		// Account for invalid log domain (right value <= 0)
		if (_rightValue <= 0) _rightValue = 0.01;
		_value += logn(_leftValue, _rightValue);
	}
	else if (_node.data == "r")
	{
		// Account for divide by zero and negative root error
		_leftValue = floor(_leftValue);
		var _sign = 1;
		if (_leftValue == 0) _leftValue = 1;
		if (_rightValue < 0)
		{
			// Even root, cannot have negative root
			if (_leftValue mod 2 == 0) _rightValue = 0;
			// Odd root, add negative sign to end
			else
			{
				_sign = -1;
				_rightValue *= _sign;
			}
		}
		_value += power(_rightValue, 1 / _leftValue) * _sign;
		//show_debug_message(power(27, (1 / 3)));
	}
	
	// Return value
	return _value;
}

/// @func	getGraphOutput({real} input);
/// Returns the output of the graph's function [x = input, y = output]
getGraphOutput = function(_input)
{
	return evaluateExpression(_input, expressionTree.root);
}

/// @func	damageGraph();
damageGraph = function()
{
	// Destroy graph hp <= 0
	hp--;
	if (hp <= 0) instance_destroy();
}

/// @func	pointAboveGraph({real} x, {real} y);
pointAboveGraph = function(_x, _y)
{
	var _graphOutputY = getGraphOutput(convertXToGraphX(_x)), _graphY = convertYToGraphY(_y);
	return _graphY > _graphOutputY;
}

/// @func	vectorCollidesWithGraph({real} startX, {real} startY, {real} endX, {real} endY);
vectorCollidesWithGraph = function(_startX, _startY, _endX, _endY)
{
	// If starting point above and ending point below graph
	if (pointAboveGraph(_startX, _startY) && !pointAboveGraph(_endX, _endY))
	{
		// Ignore collision if vertical asymptote
		var _startOutput = getGraphOutput(convertXToGraphX(_startX));
		var _endOutput = getGraphOutput(convertXToGraphX(_endX));
		if (_startOutput < -verticalAsymptoteValue && _endOutput > verticalAsymptoteValue) return false;
		
		// Not a vertical asymptote, collision occurred
		return true;
	}
	return false;
}