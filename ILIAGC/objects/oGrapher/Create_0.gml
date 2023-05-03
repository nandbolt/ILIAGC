// State
editingEquation = false;

// Equation cursor
cursor = false;
blinkTimer = 0;
blinkFrequency = 20;

// Equation
tokenIdxs = [];

// Player
playerSpriteInstance = noone;

/// @func	graphEquation();
graphEquation = function()
{
	// Damage existing graphs
	with (oGraph)
	{
		damageGraph();
	}
	
	// Create graph (at origin)
	var _graph = instance_create_layer(16,176,"Instances",oGraph);
	with (_graph)
	{
		// Create expression tree, then graph path if tree was successful
		if (createExpressionTree(other.tokenIdxs))
		{
			createGraphPath();
			other.tokenIdxs = [];
		}
		else instance_destroy();
	}
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