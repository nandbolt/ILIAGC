// Rigid body
initRigidBody();

// Movement vectors
xInput = 0;

// Movement scalars
runStrength = 0.2;
driftStrength = 0.05;
normalGroundConstant = 0.15;
slideConstant = 0.02;

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

// Graph
graphPosition = new Vector2();

// Sprites
spriteRotationSpeed = 0.1;

// Mouse
mouseInput = false;
mousePressedInput = false;

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

/// @func	takeDamage({real} damage);
takeDamage = function(_damage)
{
	// If not invincible
	if (!invincible && oWorld.gameStarted)
	{
		// Decrement game timer
		oWorld.gameTimer -= _damage;
		
		// End game if timer reached zero
		if (oWorld.gameTimer <= 0)
		{
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
		}
	}
}