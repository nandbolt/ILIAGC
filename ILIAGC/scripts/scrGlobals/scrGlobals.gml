#region Global Variables

// GX Games challenges
if (os_type == os_gxgames)
{
	// Challenge info
	global.challengeIdCoinRush = "87009ca6-3303-40eb-ace4-7dfdd3daeb0b";
	global.currentChallenge = gxc_get_query_param("challenge");
	global.currentHighScore = 0;
}

#endregion

#region Macros

#macro CANVAS_BASE_WIDTH 176*5
#macro CANVAS_BASE_HEIGHT 208*5
#macro TILE_SIZE 16
#macro HALF_TILE_SIZE 8

#endregion

#region Enums

enum InputAction
{
	LEFT,
	RIGHT,
	UP,
	DOWN,
	JUMP,
	INTERACT,
	START,
	SELECT,
	MENU_LEFT,
	MENU_RIGHT,
	MENU_UP,
	MENU_DOWN,
	CLEAR,
}

enum InputState
{
	NONE,
	PRESSED,
	HELD,
	RELEASED,
}

enum ControlType
{
	KEYBOARD = -1,
	GAMEPAD = 0,
	TOUCH = 1,
}

enum Collision
{
	SLIDE,
	BOUNCE,
}

enum TokenIndexs
{
	UNDERSCORE			= 0,
	SPACE				= 1,
	NUM0				= 2,
	NUM1				= 3,
	NUM2				= 4,
	NUM3				= 5,
	NUM4				= 6,
	NUM5				= 7,
	NUM6				= 8,
	NUM7				= 9,
	NUM8				= 10,
	NUM9				= 11,
	X					= 12,
	Y					= 13,
	EQUAL_SIGN			= 14,
	PLUS				= 15,
	MINUS				= 16,
	ASTERISK			= 17,
	SLASH				= 18,
	CARROT				= 19,
	OPEN_PARENTHESIS	= 20,
	CLOSE_PARENTHESIS	= 21,
	SINE				= 22,
	COSINE				= 23,
	TANGENT				= 24,
	LOG					= 25,
	ROOT				= 26,
	PI					= 27,
	E					= 28,
	DECIMAL				= 29,
	ENTER				= 30,
	BACKSPACE			= 31,
	TAB					= 32,
	RIGHT				= 33,
	LEFT				= 34,
	DOWN				= 35,
	UP					= 36,
}

enum ShopItem
{
	POWERUP,
	UPGRADE,
	CHARACTER,
	MODE,
	FOOD,
	THEME,
	MISC,
}

enum Mode
{
	COIN_RUSH,
	SOCCER,
	PUZZLE,
}

enum Powerup
{
	SHIELD,
	AIR_JUMP,
	INVINCIBLE,
	BALL,
	IRON_GRAPH,
	BLOCK,
}

enum Upgrade
{
	EQUATION_UP,
}

enum Misc
{
	DEBUG_MODE,
}

enum Theme
{
	DEFAULT,
	DAY,
	BASIC,
	AQUA,
	GREEN,
	ALT_DEFAULT,
	TI_83,
	NEOKYO_CITY,
	NNE,
}

enum Character
{
	HUMAN,
	DOG,
	SLIME,
}

enum Food
{
	BUBBLE_TEA,
	SPAGHETTI,
	CHOCOLATE,
}

#endregion