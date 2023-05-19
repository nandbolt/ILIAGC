// Gamepad count
var _maxGamepadSlot = gamepad_get_device_count();
gamepadCount = 0;

// Loop through gamepads
for (var _gamepadId = 0; _gamepadId < _maxGamepadSlot; _gamepadId++)
{
	// If connected
	if (gamepad_is_connected(_gamepadId))
	{
		// If any gamepad button is pressed
		if (gamepad_button_check_pressed(_gamepadId, gp_start) ||
			gamepad_button_check_pressed(_gamepadId, gp_select) ||
			gamepad_button_check_pressed(_gamepadId, gp_padl) ||
			gamepad_button_check_pressed(_gamepadId, gp_padr) ||
			gamepad_button_check_pressed(_gamepadId, gp_padu) ||
			gamepad_button_check_pressed(_gamepadId, gp_padd) ||
			abs(gamepad_axis_value(_gamepadId, gp_axislh) > 0.5) ||
			abs(gamepad_axis_value(_gamepadId, gp_axislv) > 0.5))
		{
			// Get info
			var _thisGamepadPlayerId = ds_list_find_index(playerGamepadIds, _gamepadId);
			var _gamepadUsed = (_thisGamepadPlayerId >= 0);
			
			// If gamepad not used
			if (!_gamepadUsed)
			{
				// Get if P1 using keyboard
				var _firstPlayerUsingKeyboard = (ds_list_find_value(playerGamepadIds, 0) == -1);
				
				// Replace first index with gamepad id if was using keyboard
				if (_firstPlayerUsingKeyboard) ds_list_replace(playerGamepadIds, 0, _gamepadId);
				// Else add new player if below max players
				else if (ds_list_size(playerGamepadIds) < maxPlayers) ds_list_add(playerGamepadIds, _gamepadId);
			}
		}
		
		// Increment gamepads available
		gamepadCount++;
	}
}

// Check for disconnected gamepads
for (var _playerId = ds_list_size(playerGamepadIds) - 1; _playerId >= 0; _playerId--)
{
	// Get current gamepad
	var _thisPlayerGamepadId = playerGamepadIds[| _playerId];
	if (_thisPlayerGamepadId >= 0)
	{
		// Remove gamepad if not connected
		if (!gamepad_is_connected(_thisPlayerGamepadId)) ds_list_delete(playerGamepadIds, _playerId);
	}
}

// Make sure there is at least one player
if (ds_list_empty(playerGamepadIds)) ds_list_add(playerGamepadIds, -1);

// Switch P1 to keyboard if button is pressed
if (keyboard_check_pressed(vk_anykey)) ds_list_replace(playerGamepadIds, 0, -1);

// Read and store all inputs
for (var _playerId = 0; _playerId < ds_list_size(playerGamepadIds); _playerId++)
{
	// Get current gamepad
	var _thisGamepadId = ds_list_find_value(playerGamepadIds, _playerId);
	
	// Loop through actions
	for (var _thisInputAction = 0; _thisInputAction < array_length(inputStates[0]); _thisInputAction++)
	{
		// If not keyboard
		if (_thisGamepadId != -1)
		{
			// Check gamepad inputs
			var _thisInputButton = inputGamepadKeys[_thisInputAction];
			
			// Update input types
			if (gamepad_button_check_pressed(_thisGamepadId, _thisInputButton)) inputStates[_playerId][_thisInputAction] = InputState.PRESSED;
			else if (gamepad_button_check(_thisGamepadId, _thisInputButton)) inputStates[_playerId][_thisInputAction] = InputState.HELD;
			else if (gamepad_button_check_released(_thisGamepadId, _thisInputButton)) inputStates[_playerId][_thisInputAction] = InputState.RELEASED;
			else inputStates[_playerId][_thisInputAction] = InputState.NONE;
		}
		else
		{
			// Check keyboard inputs
			var _thisKeyboardButton = inputKeyboardKeys[_thisInputAction];
			
			// Update input types
			if (keyboard_check_pressed(_thisKeyboardButton)) inputStates[_playerId][_thisInputAction] = InputState.PRESSED;
			else if (keyboard_check(_thisKeyboardButton)) inputStates[_playerId][_thisInputAction] = InputState.HELD;
			else if (keyboard_check_released(_thisKeyboardButton)) inputStates[_playerId][_thisInputAction] = InputState.RELEASED;
			else inputStates[_playerId][_thisInputAction] = InputState.NONE;
		}
	}
}