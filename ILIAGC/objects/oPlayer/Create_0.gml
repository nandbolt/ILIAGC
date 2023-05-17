// Rigid body
initRigidBody();

// Movement vectors
xInput = 0;

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
jumpPressed = false;
jumpInputted = false;
jumpStrength = 3;
jumpBuffer = 10;
jumpBufferCounter = 0;
coyoteBuffer = 10;
coyoteBufferCounter = 0;

// Crouch
crouchInputted = false;

// States
invincible = false;
damageInvincibilityTime = 60;
invincibleTimer = 0;

// Sprites
spriteIdle = sPlayerIdle;
spriteRun = sPlayerRun;
spriteJump = sPlayerJump;
spriteFall = sPlayerFall;
spriteJumpCenter = sPlayerJumpCenter;
spriteSlide = sPlayerSlide;
spriteCrouch = sPlayerCrouch;
spriteRotationSpeed = 0.1;

// Mouse
mouseInput = false;
mousePressedInput = false;

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

#region Input Functions

/// @func	getLeftXInput();
getLeftXInput = function()
{
	return keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_button_check(0,gp_padl) || touchInputLeft();
}

/// @func	getRightXInput();
getRightXInput = function()
{
	return keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_button_check(0,gp_padr) || touchInputRight();
}

/// @func	getJumpPressedInput();
getJumpPressedInput = function()
{
	return keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(0,gp_face1) || touchInputJumpPressed();
}

/// @func	getJumpInput();
getJumpInput = function()
{
	return keyboard_check(vk_space) || keyboard_check(ord("J")) || gamepad_button_check(0,gp_face1) || touchInputJump();
}

/// @func	getCrouchInput();
getCrouchInput = function()
{
	return keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_button_check(0,gp_padd) || touchInputDown();
}

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
		else oWorld.gameTimer -= _damage;
		
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