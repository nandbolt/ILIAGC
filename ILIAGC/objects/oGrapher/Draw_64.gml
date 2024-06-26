// Position
var _x = 0, _y = 0;
var _s = 0.5, _yoff = 7;
var _c = c_white;

// Equation
_x = 24;
_y = 200;
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
	
	// Alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
		
	// Help menus
	_y = 36;
	_x = 22;
	var _title = "";
	if (!oGame.tidyUI) _title += "(" + string(menuIdx + 1) + "/" + string(menuCount + 1) + ") ";
	draw_set_color(c_white);
	switch (menuIdx)
	{
		case 0:
			#region How To Graph
			_title += "How To Graph";
			draw_sprite_stretched(sBorder,0,_x-2,_y-1,178-_x-2,75-_y-1);
			_y += _yoff;
			draw_text_transformed(_x, _y, "1. Choose an EQ to edit (y1,y2,...)", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "2. Type in an EQ using valid tokens", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "3. Enter a valid EQ to graph it", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "4. Exit EQ Editor", _s, _s, 0);
			_y += _yoff;
			#endregion
			break;
		case 1:
			#region EQ Editor Controls
			_title += "Equation Tokens";
			draw_sprite_stretched(sBorder,0,_x-2,_y-1,178-_x-2,82-_y-1);
			_y += _yoff;
			draw_text_transformed(_x, _y, "(): Parenthesis", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, ".: Decimal", _s, _s, 0);
			_y += _yoff;
			draw_set_color(c_gray);
			draw_text_transformed(_x, _y, "0-9: Numbers", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "P: PI", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "E: Euler's Number", _s, _s, 0);
			_y = 36 + _yoff;
			_x = room_width * 0.5 + 8;
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
			_title += "Example EQs";
			draw_sprite_stretched(sBorder,0,_x-2,_y-1,178-_x-2,112-_y-1);
			_y += _yoff;
			
			// Basic EQs
			draw_text_transformed(_x, _y, "y = 2", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = x", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = (x+3)/4", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 9/x", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = -sinx+2", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 2cosx+3", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = tan(x/2)", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = logx+2", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = rootx+2", _s, _s, 0);
			_y += _yoff;
			
			// Complex EQs
			_x += 54;
			_y = 36 + _yoff;
			draw_text_transformed(_x, _y, "y = .5x^2-5x+14", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 3+3root(x-5)", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 1/(sinx)+4", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = x+cosx", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 1+e^(.2xsin(.9pix))", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 3(elogX)+sin(2X)", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = .4((1-x)/(x-5))+5", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = root(20sinx)+2", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "y = 2sin(2sin(2sinX))+3", _s, _s, 0);
			_y += _yoff;
			#endregion
			break;
		case 3:
			#region Table
			_title += "Table";
			draw_sprite_stretched(sBorder,0,_x-2,_y-1,178-_x-2,98-_y-1);
			_y += _yoff * 2;
			var _x2 = _x + 20, _x3 = room_width * 0.5 + 8;
			var _x4 = _x3 + 20;
			draw_text_transformed(_x4, _y, "Y", _s, _s, 0);
			draw_text_transformed(_x2, _y, "Y", _s, _s, 0);
			draw_set_color(c_aqua);
			draw_text_transformed(_x3, _y, "X", _s, _s, 0);
			draw_text_transformed(_x, _y, "X", _s, _s, 0);
			var _c = make_color_rgb(149,149,149);
			draw_sprite_ext(sGraphSegment, 0, _x4-2, _y+1, 41, 0.5, 270, _c, 0.8);
			draw_sprite_ext(sGraphSegment, 0, _x2-2, _y+1, 41, 0.5, 270, _c, 0.8);
			draw_sprite_ext(sGraphSegment, 0, _x-1, _y+7, 34, 0.5, 0, _c, 0.8);
			draw_sprite_ext(sGraphSegment, 0, _x3-1, _y+7, 34, 0.5, 0, _c, 0.8);
			_y += _yoff;
			draw_set_color(c_white);
			draw_text_transformed(_x, _y, "0", _s, _s, 0);
			draw_text_transformed(_x2, _y, string(table[0]), _s, _s, 0);
			draw_text_transformed(_x3, _y, "5", _s, _s, 0);
			draw_text_transformed(_x4, _y, string(table[5]), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "1", _s, _s, 0);
			draw_text_transformed(_x2, _y, string(table[1]), _s, _s, 0);
			draw_text_transformed(_x3, _y, "6", _s, _s, 0);
			draw_text_transformed(_x4, _y, string(table[6]), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "2", _s, _s, 0);
			draw_text_transformed(_x2, _y, string(table[2]), _s, _s, 0);
			draw_text_transformed(_x3, _y, "7", _s, _s, 0);
			draw_text_transformed(_x4, _y, string(table[7]), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "3", _s, _s, 0);
			draw_text_transformed(_x2, _y, string(table[3]), _s, _s, 0);
			draw_text_transformed(_x3, _y, "8", _s, _s, 0);
			draw_text_transformed(_x4, _y, string(table[8]), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "4", _s, _s, 0);
			draw_text_transformed(_x2, _y, string(table[4]), _s, _s, 0);
			draw_text_transformed(_x3, _y, "9", _s, _s, 0);
			draw_text_transformed(_x4, _y, string(table[9]), _s, _s, 0);
			_y += _yoff;
			#endregion
			break;
	}
	draw_set_color(c_yellow);
	_y = 36;
	_x = 22;
	if (!oGame.tidyUI)
	{
		if (os_type == os_android || !firstPlayerUsingKeyboard())
		{
			draw_sprite_ext(sButtonLT, 0, _x, _y + .5, 0.75, 0.75, 0, c_white, 1);
			draw_sprite_ext(sButtonRT, 0, _x + 8, _y + .5, 0.75, 0.75, 0, c_white, 1);
			draw_text_transformed(_x + 15, _y, _title, _s, _s, 0);
		}
		else
		{
			draw_sprite_ext(sKeyArrowLeft, 0, _x, _y + .5, 0.75, 0.75, 0, c_white, 1);
			draw_sprite_ext(sKeyArrowRight, 0, _x + 6, _y + .5, 0.75, 0.75, 0, c_white, 1);
			draw_text_transformed(_x + 12, _y,_title, _s, _s, 0);
		}
	}
	else draw_text_transformed(_x, _y, _title, _s, _s, 0);
	
	// Grapher's note
	if (graphNote != "")
	{
		// Setup
		draw_set_valign(fa_bottom);
		
		// Border
		var _noteWidth = string_width(graphNote)
		draw_sprite_ext(sBorder, 0, 0, 182.5, ((_noteWidth + 8)  / 32), 0.55, 0, c_white, 1);
		
		// Note
		draw_text_transformed(2, 191, graphNote, _s, _s, 0);
	}
	
	// Iron graphs
	_x = 168;
	_y = 191;
	repeat (ironGraphs)
	{
		draw_sprite(sIron, 0, _x, _y);
		_x -= TILE_SIZE;
	}
	
	// Reset color
	draw_set_color(c_white);
}

// Y number
draw_sprite_ext(sTokens, graphIdx + 3, 12, 204, 0.5, 0.5, 0, c_white, 1);

// Cooldown
var _amount = (graphs[graphIdx][2] / graphCooldown) * 100;
draw_set_alpha(0.75);
draw_healthbar(1, 193, 175, 206, _amount, c_white, c_black, c_black, 0, false, false);
draw_set_alpha(1);