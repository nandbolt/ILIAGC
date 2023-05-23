/// @func	inputCreate({int} inputAction, {int} keyboardHotkey, {int} inputGamepadKey);
function inputCreate(_inputAction, _inputHotkey, _inputGamepadKey)
{
	with (oInput)
	{
		// Assign keyboard + gamepad keys
		inputKeyboardKeys[_inputAction] = _inputHotkey;
		inputGamepadKeys[_inputAction] = _inputGamepadKey;
		
		// Assign input action state to none for all players
		for (var _p = 0; _p < maxPlayers; _p++)
		{
			inputStates[_p, _inputAction] = InputState.NONE;
		}
	}
}

/// @func	inputPressed({int} playerId, {int} inputId);
function inputPressed(_playerId, _inputId)
{
	with (oInput)
	{
		return inputStates[_playerId][_inputId] == InputState.PRESSED;
	}
}

/// @func	inputHeld({int} playerId, {int} inputId, {bool} countPressAsHold);
function inputHeld(_playerId, _inputId, _countPressAsHold=true)
{
	with (oInput)
	{
		return (inputStates[_playerId][_inputId] == InputState.HELD) || ((inputStates[_playerId][_inputId] == InputState.PRESSED) && _countPressAsHold);
	}
}

/// @func	inputReleased({int} playerId, {int} inputId);
function inputReleased(_playerId, _inputId)
{
	with (oInput)
	{
		return inputStates[_playerId][_inputId] == InputState.RELEASED;
	}
}

/// @func	firstPlayerUsingKeyboard();
function firstPlayerUsingKeyboard()
{
	with (oInput)
	{
		return playerGamepadIds[| 0] == -1;
	}
}


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