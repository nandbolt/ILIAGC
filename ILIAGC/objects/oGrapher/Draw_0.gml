// Position
var _x = 24, _y = 200;
var _s = 0.5, _yoff = 7;

// Tab
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (editingEquation) draw_set_alpha(0.25);
draw_text_transformed(22, 24, "Tab: EQ Editor", _s, _s, 0);
draw_set_alpha(1);

// Equation
for (var _i = 0; _i < array_length(equationTokens); _i++)
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
	draw_text_transformed(room_width * 0.5, 24, "PAUSED", 0.75, 0.75, 0);
	
	// Show info
	if (showInfo) draw_text_transformed(150, 24, "H: Hide Info", _s, _s, 0);
	else draw_text_transformed(150, 24, "H: Show Info", _s, _s, 0);
	
	// If show info
	if (showInfo)
	{
		// Alignment
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
	
		// Previous Postfix Equation
		draw_set_color(c_yellow);
		draw_text_transformed(22, 170,"Postfix EQ: " + previousPostfixEquation, _s, _s, 0);
	
		#region EQ Editor Controls
	
		_y = 36;
		_x = 22;
		draw_set_color(c_yellow);
		draw_text_transformed(_x, _y,"EQ Editor", _s, _s, 0);
		_y += _yoff;
		draw_set_color(c_white);
		draw_text_transformed(_x, _y, "Enter: Graph EQ", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Back: Delete Token", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Space: Damage Graph", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "(): Parenthesis", _s, _s, 0);
		_y += _yoff;
		draw_set_color(c_gray);
		draw_text_transformed(_x, _y, "0-9: Numbers", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, ".: Decimal", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "P: PI", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "E: Euler's Number", _s, _s, 0);
		_y += _yoff;
		draw_set_color(c_aqua);
		draw_text_transformed(_x, _y, "X: Input", _s, _s, 0);
		_y += _yoff;
		draw_set_color(c_lime);
		draw_text_transformed(_x, _y, "+-*/^: Basic Operators", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "S,C,T: Sin, Cos, Tan", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "    {amp} S {arg}", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "L: Logarithm", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "    {base} L {arg}", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "R: Root", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "    {root} R {arg}", _s, _s, 0);
		_y += _yoff;
	
		#endregion
	
		#region Movement Controls
	
		_y = 36;
		_x = room_width * 0.5 + 6;
		draw_set_color(c_yellow);
		draw_text_transformed(_x, _y,"Movement", _s, _s, 0);
		_y += _yoff;
		draw_set_color(c_white);
		draw_text_transformed(_x, _y, "AD: Run", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Space: Jump", _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "S: Go Down Platform", _s, _s, 0);
		_y += _yoff;
	
		#endregion
	
		#region Example EQs
	
		_y = 36 + _yoff * 7;
		_x = room_width * 0.5 + 6;
		draw_set_color(c_yellow);
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
	}
	
	draw_set_color(c_white);
}

// Y number
draw_sprite_ext(sTokens, graphIdx + 3, 12, 204, 0.5, 0.5, 0, c_white, 1);