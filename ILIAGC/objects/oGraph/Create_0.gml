// Graph
graphOrigin = new Vector2(convertXToGraphX(x),convertYToGraphY(y));
graphPath = path_add();

// Equation
expressionTree = new Tree();

// Health (to manage how many graphs on screen at once)
hp = 2;

/// @func	createExpressionTree({array} tokenIdxs);
createExpressionTree = function(_tokenIdxs)
{
	// Create stack/init current node
	currentNode = expressionTree.root;
	nodeStack = ds_stack_create();
	
	// Loop through tokenIdxs
	for (var _i = 0; _i < array_length(_tokenIdxs); _i++)
	{
		// Get token
		var _tokenIdx = _tokenIdxs[_i];
		
		// If current node is noone
		if (currentNode == noone)
		{
			// Set node
			currentNode = new TreeNode();
			expressionTree.root = currentNode;
			ds_stack_push(nodeStack,currentNode);
		}
		
		// Add new node if '('
		if (_tokenIdx == TokenIndexs.OPEN_PARENTHESIS)
		{
			// Create/push new left child
			currentNode.leftChild = new TreeNode();
			ds_stack_push(nodeStack,currentNode);
			currentNode = currentNode.leftChild;
		}
		// Pop node if ')'
		else if (_tokenIdx == TokenIndexs.CLOSE_PARENTHESIS)
		{
			// Pop node off stack if not empty
			if (!ds_stack_empty(nodeStack)) currentNode = ds_stack_pop(nodeStack);
		}
		// X or Operator
		else if ((_tokenIdx > TokenIndexs.NUM9 && _tokenIdx < TokenIndexs.OPEN_PARENTHESIS) || (_tokenIdx > TokenIndexs.CLOSE_PARENTHESIS && _tokenIdx < TokenIndexs.PI))
		{
			// Set node data to string operator
			currentNode.data = convertTokenIndexToString(_tokenIdx);
			
			// X (treat like a number)
			if (_tokenIdx == TokenIndexs.X) currentNode = ds_stack_pop(nodeStack);
			// Operator
			else
			{
				ds_stack_push(nodeStack,currentNode);
				currentNode.rightChild = new TreeNode();
				currentNode = currentNode.rightChild;
			}
		}
		// Number
		else
		{
			// Update node data
			if (_tokenIdx == TokenIndexs.PI) currentNode.data = pi;
			else if (_tokenIdx == TokenIndexs.E) currentNode.data = 2.72;
			else currentNode.data = real(convertTokenIndexToString(_tokenIdx));
			currentNode = ds_stack_pop(nodeStack);
		}
	}
	
	// Destroy stack
	ds_stack_destroy(nodeStack);
	
	with (expressionTree)
	{
		printTree(root);
	}
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
	else if (_node.data == "^") _value += power(_leftValue, _rightValue);
	else if (_node.data == "s") _value += _leftValue * sin(_rightValue);
	else if (_node.data == "c") _value += _leftValue * cos(_rightValue);
	else if (_node.data == "t")
	{
		// Account for divide by zero error
		var _cosine = cos(_rightValue);
		if (_cosine == 0) _cosine = 0.01;
		_value += _leftValue * (sin(_rightValue) / _cosine);
	}
	else if (_node.data == "l") _value += logn(_leftValue, _rightValue);
	else if (_node.data == "r")
	{
		// Account for divide by zero and negative root error
		if (_leftValue == 0) _leftValue = 1;
		if (_rightValue < 0) _rightValue = 0;
		_value += power(_rightValue,1 / _leftValue);
	}
	
	// Return value
	return _value;
}

/// @func	getGraphOutput({real} input);
/// Returns the output of the graph's function [x = input, y = output]
getGraphOutput = function(_input)
{
	return evaluateExpression(_input,expressionTree.root);
}

/// @func	damageGraph();
damageGraph = function()
{
	// Destroy graph hp <= 0
	hp--;
	if (hp <= 0) instance_destroy();
}