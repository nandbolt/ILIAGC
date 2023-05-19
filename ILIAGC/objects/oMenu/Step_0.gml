// Select current button if not selected
with (buttons[buttonIdx])
{
	if (!selected) select();
}

// Inputs
selectedPressed = inputPressed(0, InputAction.JUMP);
if (inputPressed(0, InputAction.RIGHT)) inputAction = InputAction.RIGHT;
else if (inputPressed(0, InputAction.LEFT)) inputAction = InputAction.LEFT;
else if (inputPressed(0, InputAction.UP)) inputAction = InputAction.UP;
else if (inputPressed(0, InputAction.DOWN)) inputAction = InputAction.DOWN;
else inputAction = -1;

// If selected pressed
if (selectedPressed)
{
	// Call button on pressed
	with (buttons[buttonIdx])
	{
		onPressed();
	}
}
// Else if inputted a direction
else if (inputAction != -1)
{
	// Get button neighbor corresponding to input direction
	var _neighbor = buttons[buttonIdx].neighbors[inputAction];
	if (_neighbor != noone)
	{
		// Loop through buttons to find neighbor
		var _neighborIdx = buttonIdx;
		for (var _i = 0; _i < array_length(buttons); _i++)
		{
			// If buttons have same object index (same button)
			if (buttons[_i].object_index == _neighbor)
			{
				// Update neighbor button index
				_neighborIdx = _i;
				break;
			}
		}
		
		// If found neighbor
		if (_neighborIdx != buttonIdx)
		{
			// Unselect current button
			with (buttons[buttonIdx])
			{
				unselect();
			}
			
			// Update current button index
			buttonIdx = _neighborIdx;
		
			// Select new current button
			with (buttons[buttonIdx])
			{
				select();
			}
		}
	}
}