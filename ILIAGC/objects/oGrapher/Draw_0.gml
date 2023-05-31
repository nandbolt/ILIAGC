// Position
var _x = 0, _y = 0;
var _s = 0.5;

#region Pause + Toggle EQ

// If not tidy ui
if (!oGame.tidyUI)
{
	// Aligment + origin
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	_x = 16;
	_y = 16;

	// Paused alpha
	if (oGame.gamePaused) draw_set_alpha(0.25);
	else draw_set_alpha(0.75);

	// Pause
	if (!editingEquation)
	{
		draw_sprite(sIconPause, 0, _x, _y)
		draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
		if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonStart, 0, _x + 20, _y + 4);
		else draw_sprite(sKeyEscape, 0, _x + 20, _y + 4);
		_y += 16;
	}

	// Toggle EQ
	if (editingEquation || !oGame.gamePaused)
	{
		draw_sprite(sIconGraph, 0, _x, _y)
		draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
		if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonSelect, 0, _x + 20, _y + 4);
		else draw_sprite(sKeyTab, 0, _x + 20, _y + 4);
		
		// Controls
		if (editingEquation)
		{
			draw_set_alpha(0.75);
			_x = TILE_SIZE * 8;
			_y = TILE_SIZE * 7;
			
			// Graph
			if (!firstPlayerUsingKeyboard() || os_type == os_android) _x += TILE_SIZE;
			draw_sprite(sIconGraph2, 0, _x, _y)
			draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
			if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonX, 0, _x + 20, _y + 4);
			else draw_sprite(sKeyEnter, 0, _x + 20, _y + 4);
			_y += 16;
			_x = TILE_SIZE * 8;
			
			// Clear graph
			if (!firstPlayerUsingKeyboard() || os_type == os_android) _x += TILE_SIZE;
			draw_sprite(sIconClearGraph, 0, _x, _y)
			draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
			if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonB, 0, _x + 20, _y + 4);
			else draw_sprite(sKeySpace, 0, _x + 20, _y + 4);
			_y += 16;
			_x = TILE_SIZE * 8;
			
			// Next graph
			if (!firstPlayerUsingKeyboard() || os_type == os_android) _x += TILE_SIZE;
			draw_sprite(sIconGraph3, 0, _x, _y)
			draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
			if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonRB, 0, _x + 20, _y + 4);
			else draw_sprite(sKeyArrowUp, 0, _x + 20, _y + 4);
			_y += 16;
		}
	}

	// Reset alpha
	draw_set_alpha(1);
}

#endregion