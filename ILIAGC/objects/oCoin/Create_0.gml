// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update coins
		coins++;
	}
	
	// Spawn next coin
	instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
}