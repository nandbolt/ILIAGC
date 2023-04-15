// If editing equation
if (editingEquation)
{
	#region Check Equation Inputs
	
	// Enter
	if (keyboard_check_pressed(vk_enter))
	{
		// Graph equation/clear tokenIdxs
		graphEquation();
		tokenIdxs = [];
		editingEquation = false;
	}
	// Backspace
	else if (keyboard_check_pressed(vk_backspace) && array_length(tokenIdxs) > 0)
	{
		// Remove token
		array_pop(tokenIdxs);
	}
	// 0
	else if (keyboard_check_pressed(ord("0")) && !keyboard_check(vk_shift)) array_push(tokenIdxs, 2);
	// 1
	else if (keyboard_check_pressed(ord("1"))) array_push(tokenIdxs, 3);
	// 2
	else if (keyboard_check_pressed(ord("2"))) array_push(tokenIdxs, 4);
	// 3
	else if (keyboard_check_pressed(ord("3"))) array_push(tokenIdxs, 5);
	// 4
	else if (keyboard_check_pressed(ord("4"))) array_push(tokenIdxs, 6);
	// 5
	else if (keyboard_check_pressed(ord("5"))) array_push(tokenIdxs, 7);
	// 6
	else if (keyboard_check_pressed(ord("6")) && !keyboard_check(vk_shift)) array_push(tokenIdxs, 8);
	// 7
	else if (keyboard_check_pressed(ord("7"))) array_push(tokenIdxs, 9);
	// 8
	else if (keyboard_check_pressed(ord("8")) && !keyboard_check(vk_shift)) array_push(tokenIdxs, 10);
	// 9
	else if (keyboard_check_pressed(ord("9")) && !keyboard_check(vk_shift)) array_push(tokenIdxs, 11);
	// X
	else if (keyboard_check_pressed(ord("X"))) array_push(tokenIdxs, 12);
	// +
	else if (keyboard_lastchar == "+")
	{
		array_push(tokenIdxs, 15);
		keyboard_lastchar = "";
	}
	// -
	else if (keyboard_lastchar == "-")
	{
		array_push(tokenIdxs, 16);
		keyboard_lastchar = "";
	}
	// *
	else if (keyboard_lastchar = "*")
	{
		array_push(tokenIdxs, 17);
		keyboard_lastchar = "";
	}
	// /
	else if (keyboard_lastchar = "/")
	{
		array_push(tokenIdxs, 18);
		keyboard_lastchar = "";
	}
	// ^
	else if (keyboard_lastchar = "^")
	{
		array_push(tokenIdxs, 19);
		keyboard_lastchar = "";
	}
	// (
	else if (keyboard_lastchar == "(")
	{
		array_push(tokenIdxs, 20);
		keyboard_lastchar = "";
	}
	// )
	else if (keyboard_lastchar == ")")
	{
		array_push(tokenIdxs, 21);
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