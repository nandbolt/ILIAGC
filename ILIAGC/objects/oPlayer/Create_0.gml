// Rigid body
initRigidBody();

oWorld.coinsInBank = 1000;

// Player
playerId = 0;
playerColor = c_white;

// Inputs
inputDirection = new Vector2();
jumpPressed = false;
jumpInputted = false;
interactPressed = false;
crouchInputted = false;

// Movement scalars
runStrength = 0.2;
driftStrength = 0.05;
runGroundConstant = 0.15;
idleGroundConstant = 0.3;
slideGroundConstant = 0.02;
holdGroundConstant = 2;

// Gravity
normalGravityStrength = gravityStrength;

// Jumping
jumpStrength = 3;
jumpBuffer = 10;
jumpBufferCounter = 0;
coyoteBuffer = 10;
coyoteBufferCounter = 0;

// States
invincible = false;
damageInvincibilityTime = 60;
invincibleTimer = 0;
deathTouch = false;

// Sprites
spriteIdle = sPlayerIdle;
spriteRun = sPlayerRun;
spriteJump = sPlayerJump;
spriteFall = sPlayerFall;
spriteJumpCenter = sPlayerJumpCenter;
spriteSlide = sPlayerSlide;
spriteCrouch = sPlayerCrouch;
spriteRotationSpeed = 0.1;

#region Powerups

// Shield
shield = 0;

// Air jump
airJumps = 0;

// Invincible
invinciblePowerActive = false;
invinciblePowerTimer = 0;
#region Rainbow Shader Uniforms
rainbowUniUV         = shader_get_uniform(shdrRainbow, "u_uv");
rainbowUniTime       = shader_get_uniform(shdrRainbow, "u_time");
rainbowUniSpeed      = shader_get_uniform(shdrRainbow, "u_speed");
rainbowUniSection    = shader_get_uniform(shdrRainbow, "u_section");
rainbowUniSaturation = shader_get_uniform(shdrRainbow, "u_saturation"); 
rainbowUniBrightness = shader_get_uniform(shdrRainbow, "u_brightness");
rainbowUniMix        = shader_get_uniform(shdrRainbow, "u_mix");
rainbowTime  = 0;
rainbowSpeed = 1.0;
rainbowSection = 0.5;
rainbowSaturation = 0.8;
rainbowBrightness = 0.9;
rainbowMix = 0.7;
#endregion

// Ball
kickStrength = 2;

// Block
blocks = 0;

#endregion

#region Handicaps

// Bubble gum
bubbleGumTimer = 0;

#endregion

/// @func	jump();
jump = function()
{
	// Apply jump
	velocity.y = -jumpStrength;
	
	// Reset jump
	jumpBufferCounter = 0;
	coyoteBufferCounter = 0;
	
	// Jump particles
	with (oParticles)
	{
		part_particles_create(partSystem, other.x, other.y, partTypeDust, 2);
	}
	
	// Jump sound
	audio_play_sound(sfxJump, 2, false);
}

/// @func	airJump();
airJump = function()
{
	jump();
	airJumps--;
}

/// @func	takeDamage({real} damage);
takeDamage = function(_damage)
{
	// If not invincible
	if (!invincible && oWorld.gameStarted)
	{
		// If has shield
		if (shield > 0) shield--;
		// Else decrement game timer
		else
		{
			oWorld.gameTimer -= _damage;
			with (instance_create_layer(x, y, "Instances", oTimeParticle))
			{
				value = "-" + string(_damage);
				image_blend = c_red;
			}
		}
		
		// End game if timer reached zero
		if (oWorld.gameTimer <= 0)
		{
			oWorld.gameTimer = 0;
			with (oWorld)
			{
				endGameCoinRush();
			}
		}
		else
		{
			// Player invinciblity
			invincible = true;
			invincibleTimer = damageInvincibilityTime;
			
			// Hurt sound
			audio_play_sound(sfxHurt, 1, false);
		}
	}
}

/// @func	onLand();
onLand = function(){}

/// @func	updateTheme({int} theme);
updateTheme = function(_theme){}