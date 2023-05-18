#region Keyboard + Mouse

//keyboardCheckRightInput

#endregion

#region Gamepad

#endregion

#region Touch Screen

/// @func	touchInputRight();
function touchInputRight()
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx < (room_width - TILE_SIZE) * 0.5 && _dx > (room_width - TILE_SIZE) * 0.25 && _dy < 192) return true;
	}
	return false;
}

/// @func	touchInputLeft();
function touchInputLeft()
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx < (room_width - TILE_SIZE) * 0.25 && _dy < 192) return true;
	}
	return false;
}

/// @func	touchInputDown();
function touchInputDown()
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx < (room_width - TILE_SIZE) * 0.75 && _dx > (room_width - TILE_SIZE) * 0.5 && _dy < 192) return true;
	}
	return false;
}

/// @func	touchInputJump();
function touchInputJump()
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx > (room_width - TILE_SIZE) * 0.75 && _dy < 192) return true;
	}
	return false;
}

/// @func	touchInputJumpPressed();
function touchInputJumpPressed()
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button_pressed(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx > (room_width - TILE_SIZE) * 0.75 && _dy < 192) return true;
	}
	return false;
}

/// @func	touchInputInteractPressed();
function touchInputInteractPressed()
{
	return false;
}

#endregion