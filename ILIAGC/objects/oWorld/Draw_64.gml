// Position
var _x = 8, _y = 8;
var _c = c_white;

// Coins
_x = 16;
var _coinCountString = string(coins);
if (coins > mostCoins) _c = c_aqua;
for (var _i = 1; _i <= string_length(_coinCountString); _i++)
{
	draw_sprite_ext(sTokens, real(string_char_at(_coinCountString, _i)) + 2, _x, _y, 1, 1, 0, _c, 1);
	_x += 8;
}
_c = c_white;

// Time
_x = 85;
var _gameTimeString = string(gameTimer);
if (gameTimer < 10 && gameTimer != 0) _c = c_red;
for (var _i = 1; _i <= string_length(_gameTimeString); _i++)
{
	var _char = string_char_at(_gameTimeString, _i);
	if (_char == ".") draw_sprite(sTokens, TokenIndexs.DECIMAL, _x, _y);
	else if (_char == "-") draw_sprite(sTokens, TokenIndexs.MINUS, _x, _y);
	else draw_sprite_ext(sTokens, real(_char) + 2, _x, _y, 1, 1, 0, _c, 1);
	_x += 8;
}
_c = c_aqua;

// High Score
_x = 160;
var _mostCoinsString = string(mostCoins);
if (coins > mostCoins) _c = c_white;
for (var _i = string_length(_mostCoinsString); _i > 0; _i--)
{
	draw_sprite_ext(sTokens, real(string_char_at(_mostCoinsString, _i)) + 2, _x, _y, 1, 1, 0, _c, 1);
	_x -= 8;
}

// Combo
if (comboMeter > 0)
{
	_x = TILE_SIZE * 5;
	_y = 20;
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	var _rushing = !(comboMeter < comboThreshold);
	_c = _rushing ? c_yellow : c_white;
	draw_healthbar(_x, _y - 0.5, _x + TILE_SIZE * 2, _y + 0.5, (comboTimer / comboTime) * 100, c_black, c_red, _c, 0, false,false);
	draw_text_transformed(_x - 2, _y, string(comboMeter) +"x", 0.5, 0.5, 0);
}