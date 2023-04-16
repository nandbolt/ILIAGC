// Position
var _x = 24, _y = 200;

// Equation
for (var _i = 0; _i < array_length(tokenIdxs); _i++)
{
	draw_sprite(sTokens,tokenIdxs[_i],_x,_y);
	_x += 8;
}

// If editing equation
if (editingEquation)
{
	// Cursor
	draw_sprite(sTokens,cursor,_x,_y);
	
	// Paused
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width * 0.5,room_height * 0.5,"PAUSED");
}