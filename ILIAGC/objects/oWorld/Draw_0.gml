// Position
var _x = 8, _y = 8;

// Coins
draw_sprite(sCoin,0,_x,_y);
_x += 8;
var _coinCountString = string(coins);
for (var _i = 1; _i <= string_length(_coinCountString); _i++)
{
	draw_sprite(sTokens,real(string_char_at(_coinCountString,_i))+2,_x,_y);
	_x += 8;
}

// Time
_x = 96;
var _gameTimeString = string(gameTimer);
for (var _i = 1; _i <= string_length(_gameTimeString); _i++)
{
	draw_sprite(sTokens,real(string_char_at(_gameTimeString,_i))+2,_x,_y);
	_x += 8;
}