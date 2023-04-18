// States
gameStarted = false;

// Timer
gameTimer = 0;
gameCounter = 0;
gameTimerPaused = false;

// Coins
coins = 0;
mostCoins = 0;

// Coin Sprites (HUD)
var _coinsSpriteInstance = instance_create_layer(8,8,"HUDInstances",oSprite);
with (_coinsSpriteInstance)
{
	sprite_index = sCoin;
	spins = true;
}
var _mostCoinsSpriteInstance = instance_create_layer(144,8,"HUDInstances",oSprite);
with (_mostCoinsSpriteInstance)
{
	sprite_index = sCoinHighScore;
	spins = true;
}

// Get high score from disk
ini_open("save.ini");
mostCoins = ini_read_real("high_scores","most_coins",0);
ini_close();