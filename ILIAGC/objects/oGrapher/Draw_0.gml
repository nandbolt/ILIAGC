// Position
var _x = 24, _y = 200;
var _s = 0.5, _xoff = 7, _yoff = 7;

// Tab
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (editingEquation) draw_set_alpha(0.25);
else draw_set_alpha(0.75);
draw_text_transformed(22, 24, "Tab: EQ Editor", _s, _s, 0);
draw_set_alpha(1);

// Equation
var _equationLength = array_length(equationTokens);
if (_equationLength > 18)
{
	repeat(_equationLength - 18) _x -= 8;
}
for (var _i = 0; _i < _equationLength; _i++)
{
	draw_sprite(sTokens, equationTokens[_i], _x, _y);
	_x += 8;
}

// If editing equation
if (editingEquation)
{
	// Cursor
	draw_sprite(sTokens, cursor, _x, _y);
	
	// Paused
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width * 0.5, 24, "EQ Editor", 0.75, 0.75, 0);
	
	// Show info
	if (showInfo) draw_text_transformed(150, 24, "H: Hide Info", _s, _s, 0);
	else draw_text_transformed(150, 24, "H: Show Info", _s, _s, 0);
	
	// If show info
	if (showInfo)
	{
		// Alignment
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	
		// Previous Postfix Equation
		draw_set_color(c_gray);
		draw_text_transformed(22, 164,"Postfix EQ: " + previousPostfixEquation, _s, _s, 0);
		
		// Help menus
		_y = 36;
		_x = 22;
		draw_set_color(c_yellow);
		switch (menuIdx)
		{
			case 0:
				#region How To Graph
				draw_text_transformed(_x, _y,"How To Graph", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_white);
				draw_text_ext_transformed(_x, _y, "Hello! And yep, I'm trapped inside a calculator. But no matter! Can you help me collect coins? " +
												  "Your graphs will be of great help!\n\nTo graph an equation (EQ), input any collection of " +
												  "constants (0-9), operators (+-), parenthesis and variables (X) that make sense and hit enter. For more help, " +
												  "look at the other menus with the <> arrows! Remember: X is input, Y is output.", 14, 304,  _s, _s, 0);
				_y += _yoff;
				#endregion
				break;
			case 1:
				#region EQ Editor Controls
				draw_text_transformed(_x, _y,"EQ Editor Controls", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_white);
				draw_text_transformed(_x, _y, "Enter: Graph EQ", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "Backspace: Delete", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "Space: Destroy Graph", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "Up Arrow: Previous EQ", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "Down Arrow: Next EQ", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "(): Parenthesis", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_gray);
				draw_text_transformed(_x, _y, "0-9: Numbers", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, ".: Decimal", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "P: PI", _s, _s, 0);
				_y = 36 + _yoff;
				_x = room_width * 0.5 + 8;
				draw_text_transformed(_x, _y, "E: Euler's Number", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_aqua);
				draw_text_transformed(_x, _y, "X: Variable", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_lime);
				draw_text_transformed(_x, _y, "+-*/^: Basic Operators", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "S,C,T: Sin, Cos, Tan", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "L: {base} Log {arg}", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "R: {nth} Root {arg}", _s, _s, 0);
				_y += _yoff;
	
				#endregion
				break;
			case 2:
				#region Example EQs
				draw_text_transformed(_x, _y, "Example EQs", _s, _s, 0);
				_y += _yoff;
				draw_set_color(c_white);
				draw_text_transformed(_x, _y, "y = 2", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = -.25x+3", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = .5x^2-5x+14", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = 9/x", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = 2CX+3", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = 3+3R(X-5)", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = 3(eLX)+S(2X)", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = e^(-.2(x-9))SX", _s, _s, 0);
				_y += _yoff;
				draw_text_transformed(_x, _y, "y = 2S(2S(2SX))+2", _s, _s, 0);
				_y += _yoff;
	
				#endregion
				break;
		}
	}
	
	#region On-Screen Keyboard
	
	if (showKeyboard)
	{
		_x = keyboardX;
		_y = keyboardY;
		var _keyboardWidth = array_length(keyboard[0]), _keyboardHeight = array_length(keyboard);
		for (var _j = 0; _j < _keyboardHeight; _j++)
		{
			for (var _i = 0; _i < _keyboardWidth; _i++)
			{
				if (!(_j == 3 && _i > 6))
				{
					draw_sprite(sKeyBackground, 0, _x, _y);
					draw_sprite(sTokens, keyboard[_j][_i], _x, _y);
				}
				_x += TILE_SIZE;
			}
			_x = keyboardX;
			_y += TILE_SIZE;
		}
	}
	
	#endregion
	
	// Reset color
	draw_set_color(c_white);
}
// Draw buttons if on android
else if (os_type == os_android)
{
	_xoff = (room_width - TILE_SIZE) * 0.25;
	_x = _xoff * 0.5;
	_y = room_height * 0.7;
	draw_sprite_ext(sArrowButton,0,_x,_y,1,1,180,c_white,1);	// Left
	_x += _xoff;
	draw_sprite_ext(sArrowButton,0,_x,_y,1,1,0,c_white,1);		// Right
	_x += _xoff;
	draw_sprite_ext(sArrowButton,0,_x,_y,1,1,-90,c_white,1);	// Down
	_x += _xoff;
	draw_sprite_ext(sJumpButton,0,_x,_y,1,1,0,c_white,1);		// Jump
}

// Y number
draw_sprite_ext(sTokens, graphIdx + 3, 12, 204, 0.5, 0.5, 0, c_white, 1);
var _amount = (graphs[graphIdx][2] / graphCooldown) * 100;
draw_healthbar(4, 194, 12, 194, _amount, c_white, c_black, c_black, 1, true, false);