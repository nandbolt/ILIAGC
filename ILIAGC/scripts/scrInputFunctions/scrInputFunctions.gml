/// @func	inputCreate({int} inputAction, {int} keyboardHotkey, {int} inputGamepadKey, {int} inputTouchKey);
function inputCreate(_inputAction, _inputHotkey, _inputGamepadKey, _inputTouchKey)
{
	with (oInput)
	{
		// Assign keyboard + gamepad keys
		inputKeyboardKeys[_inputAction] = _inputHotkey;
		inputGamepadKeys[_inputAction] = _inputGamepadKey;
		inputTouchKeys[_inputAction] = _inputTouchKey;
		
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

/// @func	touchInputPressed({real} x1, {real} y1, {real) x2, {real} y2);
function touchInputPressed(_x1, _y1, _x2, _y2)
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mousePressed = device_mouse_check_button_pressed(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mousePressed && _dx > _x1 && _dx < _x2 && _dy > _y1 && _dy < _y2) return true;
	}
	return false;
}

/// @func	touchInputHeld({real} x1, {real} y1, {real) x2, {real} y2);
function touchInputHeld(_x1, _y1, _x2, _y2)
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mouseHeld = device_mouse_check_button(_i, mb_left);
		//var _mouseHeld = mouse_check_button(mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mouseHeld && _dx > _x1 && _dx < _x2 && _dy > _y1 && _dy < _y2) return true;
	}
	return false;
}

/// @func	touchInputReleased({real} x1, {real} y1, {real) x2, {real} y2);
function touchInputReleased(_x1, _y1, _x2, _y2)
{
	// Check all 4 touch inputs
	for (var _i = 0; _i < 4; _i++)
	{
		var _mouseReleased = device_mouse_check_button_released(_i, mb_left);
		var _dx = device_mouse_x(_i), _dy = device_mouse_y(_i);
		if (_mouseReleased && _dx > _x1 && _dx < _x2 && _dy > _y1 && _dy < _y2) return true;
	}
	return false;
}

#endregion