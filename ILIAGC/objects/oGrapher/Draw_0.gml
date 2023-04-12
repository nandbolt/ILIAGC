// Position
var _x = 24, _y = 200;

// Equation
for (var _i = 0; _i < array_length(characters); _i++)
{
	draw_sprite(sCharacters,characters[_i],_x,_y);
	_x += 8;
}

// If editing equation
if (editingEquation)
{
	// Cursor
	draw_sprite(sCharacters,cursor,_x,_y);
}