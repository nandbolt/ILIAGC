/// @func	spawnPuzzle();
/// @desc	Removes all graph eaters and spawns a puzzle pattern.
function spawnPuzzle()
{
	// Clear graph eaters
	instance_destroy(oGraphEater);
	
	// Choose pattern
	var _x = 128, _y = 128;
	var _spacing = 12;
	switch (irandom(4))
	{
		// X Line
		case 0:
			_y = 176 - irandom_range(1,9) * TILE_SIZE;
			_spacing = 12 * irandom_range(1,3);
			for (_x = 24; _x < 180; _x += _spacing)
			{
				instance_create_layer(_x,_y,"BackgroundInstances",oGraphEater);
			}
			break;
		// Y Line
		case 1:
			_x = 176 - irandom_range(1,9) * TILE_SIZE;
			_spacing = 12 * irandom_range(1,3);
			for (_y = 24; _y < 180; _y += _spacing)
			{
				instance_create_layer(_x,_y,"BackgroundInstances",oGraphEater);
			}
			break;
		// Positive slope
		case 2:
			_y = 176 - HALF_TILE_SIZE;
			_spacing = 10 * irandom_range(1,3);
			for (_x = 24 + TILE_SIZE * irandom_range(1,5); _x < 176; _x += _spacing)
			{
				instance_create_layer(_x,_y,"BackgroundInstances",oGraphEater);
				_y -= _spacing;
			}
			break;
		// Negative slope
		case 3:
			_y = 176 - HALF_TILE_SIZE;
			_spacing = 10 * irandom_range(1,3);
			for (_x = 184 - TILE_SIZE * irandom_range(5,5); _x > 20; _x -= _spacing)
			{
				instance_create_layer(_x,_y,"BackgroundInstances",oGraphEater);
				_y -= _spacing;
			}
			break;
		// Random
		case 4:
			var _num = irandom_range(4,16)
			repeat (_num)
			{
				_x = irandom_range(24,168);
				_y = irandom_range(24,168);
				instance_create_layer(_x,_y,"BackgroundInstances",oGraphEater);
			}
			break;
		default:
			instance_create_layer(128,128,"BackgroundInstances",oGraphEater);
	}
}