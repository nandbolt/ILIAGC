// Shader
var _previousShader = shader_current();

// If invincible power active
if (invinciblePowerActive)
{
	// Pass on rainbow shader uniforms
	shader_set(shdrRainbow);
	var uv = sprite_get_uvs(sPlayerIdle, 0);
	shader_set_uniform_f(rainbowUniUV, uv[0], uv[2]);
	shader_set_uniform_f(rainbowUniSpeed, rainbowSpeed);
	shader_set_uniform_f(rainbowUniTime, rainbowTime);
	shader_set_uniform_f(rainbowUniSaturation, rainbowSaturation);
	shader_set_uniform_f(rainbowUniBrightness, rainbowBrightness);
	shader_set_uniform_f(rainbowUniSection, rainbowSection);
	shader_set_uniform_f(rainbowUniMix, rainbowMix);
}

// Booster pack
if (airJumps > baseAirJumps) draw_sprite(sBoosterPack, 0, x, y - 6);

// Self
draw_self();

// Shield
if (shield > 0)
{
	var _c = c_aqua;
	if (shield > 2) _c = c_red;
	else if (shield > 1) _c = c_lime;
	draw_sprite_ext(sShield,0,x,y,1,1,image_angle,_c,1);
}

// Block
if (blocks > 0)
{
	var _x = floor(x / TILE_SIZE) * TILE_SIZE, _y = floor(y / TILE_SIZE) * TILE_SIZE + TILE_SIZE;
	draw_sprite(sBlock,0,_x,_y);
}

// Reset shader
if (invinciblePowerActive) shader_set(_previousShader);