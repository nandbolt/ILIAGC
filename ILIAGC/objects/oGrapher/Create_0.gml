// State
editingEquation = false;

// Equation cursor
cursor = false;
blinkTimer = 0;
blinkFrequency = 20;

// Equation
tokenIdxs = [];

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
		// Create expression tree
		createExpressionTree(other.tokenIdxs);
		
		// Create graph path
		createGraphPath();
	}
}