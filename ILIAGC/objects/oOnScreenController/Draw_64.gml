var _a1 = 0.25, _a2 = 1;
var _a = _a1;

#region Controls

// Start
if (inputHeld(0, InputAction.START)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonStartArrow, 0, 176 - 38, 211, 2.5, 3, 0, c_white, _a);

// Select
if (inputHeld(0, InputAction.SELECT)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonSelectArrow, 0, 176 - 38 - 37, 211, 2.5, 3, 0, c_white, _a);

// X
if (inputHeld(0, InputAction.INTERACT)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonX2, 0, 176 - 38 - 39, 208 + 33, 2.5, 3, 0, c_white, _a);

// B
if (inputHeld(0, InputAction.CLEAR)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonB2, 0, 176 - 28, 208 + 33, 2.5, 3, 0, c_white, _a);

// A
if (inputHeld(0, InputAction.JUMP)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonA2, 0, 176 - 52, 304 - 33, 2.5, 3, 0, c_white, _a);

// Left
if (inputHeld(0, InputAction.LEFT)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonDPadLeft2, 0, 176 - 38 - 39 - 96, 208 + 33, 2.5, 3, 0, c_white, _a);

// Right
if (inputHeld(0, InputAction.RIGHT)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonDPadRight2, 0, 176 - 28 - 96, 208 + 33, 2.5, 3, 0, c_white, _a);

// Down
if (inputHeld(0, InputAction.DOWN)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonDPadDown2, 0, 176 - 52 - 96, 304 - 33, 2.5, 3, 0, c_white, _a);

// Up
if (inputHeld(0, InputAction.UP)) _a = _a2;
else _a = _a1;
draw_sprite_ext(sButtonDPadUp2, 0, 176 - 52 - 96, 211, 2.5, 3, 0, c_white, _a);

// If graphing
if (instance_exists(oGrapher) && oGrapher.editingEquation)
{
	// Left Button
	if (inputHeld(0, InputAction.MENU_UP)) _a = _a2;
	else _a = _a1;
	draw_sprite_ext(sButtonLB2, 0, 0, 86, 2.5, 2, 0, c_white, _a);

	// Left Trigger
	if (inputHeld(0, InputAction.MENU_LEFT)) _a = _a2;
	else _a = _a1;
	draw_sprite_ext(sButtonLT2, 0, 42, 86, 2.5, 2, 0, c_white, _a);

	// Right Trigger
	if (inputHeld(0, InputAction.MENU_RIGHT)) _a = _a2;
	else _a = _a1;
	draw_sprite_ext(sButtonRT2, 0, 96, 86, 2.5, 2, 0, c_white, _a);

	// Right Button
	if (inputHeld(0, InputAction.MENU_DOWN)) _a = _a2;
	else _a = _a1;
	draw_sprite_ext(sButtonRB2, 0, 138, 86, 2.5, 2, 0, c_white, _a);
}

#endregion