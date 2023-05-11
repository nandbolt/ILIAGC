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

// Self
draw_self();

// Shield
if (shield > 0) draw_sprite_ext(sShield,0,x,y,1,1,image_angle,c_white,1);

// Reset shader
if (invinciblePowerActive) shader_reset();