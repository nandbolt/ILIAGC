// If editing equation
if (editingEquation)
{
	#region Check Equation Inputs
	
	// Enter
	if (keyboard_check_pressed(vk_enter))
	{
		// Graph equation/clear characters
		characters = [];
	}
	// Backspace
	else if (keyboard_check_pressed(vk_backspace) && array_length(characters) > 0)
	{
		// Remove character
		array_pop(characters);
	}
	// 0
	else if (keyboard_check_pressed(ord("0"))) array_push(characters, 2);
	// 1
	else if (keyboard_check_pressed(ord("1"))) array_push(characters, 3);
	// 2
	else if (keyboard_check_pressed(ord("2"))) array_push(characters, 4);
	// 3
	else if (keyboard_check_pressed(ord("3"))) array_push(characters, 5);
	// 4
	else if (keyboard_check_pressed(ord("4"))) array_push(characters, 6);
	// 5
	else if (keyboard_check_pressed(ord("5"))) array_push(characters, 7);
	// 6
	else if (keyboard_check_pressed(ord("6")) && !keyboard_check(vk_shift)) array_push(characters, 8);
	// 7
	else if (keyboard_check_pressed(ord("7"))) array_push(characters, 9);
	// 8
	else if (keyboard_check_pressed(ord("8")) && !keyboard_check(vk_shift)) array_push(characters, 10);
	// 9
	else if (keyboard_check_pressed(ord("9"))) array_push(characters, 11);
	// X
	else if (keyboard_check_pressed(ord("X"))) array_push(characters, 12);
	// +
	else if (keyboard_lastchar == "+")
	{
		array_push(characters, 15);
		keyboard_lastchar = "";
	}
	// -
	else if (keyboard_lastchar == "-")
	{
		array_push(characters, 16);
		keyboard_lastchar = "";
	}
	// *
	else if (keyboard_lastchar = "*")
	{
		array_push(characters, 17);
		keyboard_lastchar = "";
	}
	// /
	else if (keyboard_lastchar = "/")
	{
		array_push(characters, 18);
		keyboard_lastchar = "";
	}
	// ^
	else if (keyboard_lastchar = "^")
	{
		array_push(characters, 19);
		keyboard_lastchar = "";
	}
	
	#endregion
	
	// Update blinking
	blinkTimer++;
	if (blinkTimer >= blinkFrequency)
	{
		cursor = !cursor;
		blinkTimer = 0;
	}
}

// If want to edit equation
if (keyboard_check_pressed(vk_tab)) 
{
	editingEquation = !editingEquation;
	
	// Reset variables
	if (editingEquation)
	{
		cursor = false;
		blinkTimer = 0;
	}
	else cursor = true;
}