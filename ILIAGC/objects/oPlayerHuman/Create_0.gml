// Inherit the parent event
event_inherited();

/// @func	updateTheme({int} theme);
updateTheme = function(_theme)
{
	switch (_theme)
	{
		case Theme.NEOKYO_CITY:
			// Sprites
			spriteIdle = sDenizenIdle;
			spriteRun = sDenizenRun;
			spriteJump = sDenizenJump;
			spriteFall = sDenizenFall;
			spriteJumpCenter = sDenizenJumpCenter;
			spriteSlide = sDenizenSlide;
			spriteCrouch = sDenizenCrouch;
			break;
		default:
			// Sprites
			spriteIdle = sPlayerIdle;
			spriteRun = sPlayerRun;
			spriteJump = sPlayerJump;
			spriteFall = sPlayerFall;
			spriteJumpCenter = sPlayerJumpCenter;
			spriteSlide = sPlayerSlide;
			spriteCrouch = sPlayerCrouch;
	}
}