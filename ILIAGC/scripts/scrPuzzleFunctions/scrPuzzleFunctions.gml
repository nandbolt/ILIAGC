/// @func	spawnPuzzle();
/// @desc	Removes all graph eaters and spawns a puzzle pattern.
function spawnPuzzle()
{
	// Clear graph eaters
	instance_destroy(oGraphEater);
	
	// Choose pattern
	var _x = 128, _y = 128;
	switch (irandom(0))
	{
		// X Line
		case 0:
			_y = 176 - irandom_range(1,9) * TILE_SIZE;
			for (_x = 24; _x < 180; _x += 12)
			{
				instance_create_layer(_x,_y,"Instances",oGraphEater);
			}
			break;
		default:
			instance_create_layer(128,128,"Instances",oGraphEater);
	}
}