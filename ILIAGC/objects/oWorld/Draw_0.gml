// Position
var _x = 8, _y = 8;

// Coins
_x = 16;
var _coinCountString = string(coins);
for (var _i = 1; _i <= string_length(_coinCountString); _i++)
{
	draw_sprite(sTokens,real(string_char_at(_coinCountString,_i))+2,_x,_y);
	_x += 8;
}

// Time
_x = 85;
var _gameTimeString = string(gameTimer);
if (!gameStarted) _gameTimeString = string(coinsInBank);
for (var _i = 1; _i <= string_length(_gameTimeString); _i++)
{
	draw_sprite(sTokens,real(string_char_at(_gameTimeString,_i))+2,_x,_y);
	_x += 8;
}

// High Score
_x = 152;
var _mostCoinsString = string(mostCoins);
for (var _i = 1; _i <= string_length(_mostCoinsString); _i++)
{
	draw_sprite(sTokens,real(string_char_at(_mostCoinsString,_i))+2,_x,_y);
	_x += 8;
}