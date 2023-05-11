// Update input
mouseInput = mouse_check_button(mb_left);
mousePressedInput = mouse_check_button_pressed(mb_left);
xInput = getRightXInput() - getLeftXInput();
jumpInputted = getJumpInput();
jumpPressed = getJumpPressedInput();
crouchInputted = getCrouchInput();

// Ignore graphs
if (crouchInputted && jumpInputted) ignoreGraphs = true;
else ignoreGraphs = false;

#region Powerups/Invincibility

// Switch scopes
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Invincible power timer
	if (invinciblePowerActive)
	{
		if (invinciblePowerTimer <= 0) invinciblePowerActive = false;
		else invinciblePowerTimer--;
	}
	
	// Air jump power timer
	if (canAirJump)
	{
		if (airJumpTimer <= 0) canAirJump = false;
		else airJumpTimer--;
	}
	
	// Update invincibility if invincible
	if (invincible && !invinciblePowerActive)
	{
		if (invincibleTimer <= 0) invincible = false;
		else invincibleTimer--;
	}
}

// Rainbow timer
if (invinciblePowerActive) rainbowTime += 1 / 60;

#endregion

// Update ground state
rbUpdateGroundState();

// Set coyote buffer
if (!grounded) coyoteBufferCounter = clamp(coyoteBufferCounter-1,0,coyoteBuffer);
else coyoteBufferCounter = coyoteBuffer;

// Resistances
if (crouchInputted) groundConstant = slideConstant;
else groundConstant = normalGroundConstant;
rbHandleResistances();

// Apply xInput to x velocity
var _moveStrength = runStrength;
if (crouchInputted) _moveStrength = 0;
if (!grounded) _moveStrength = driftStrength;
velocity.x += xInput * _moveStrength;

// Gravity
rbApplyGravity();

#region Jump

// Set jump buffer counter
if (jumpPressed && !crouchInputted) jumpBufferCounter = jumpBuffer;
else jumpBufferCounter = clamp(jumpBufferCounter-1,0,jumpBuffer);

// Jump if jump buffered and grounded or jump buffered and coyote ready
if ((jumpBufferCounter > 0 && grounded) || (jumpBufferCounter > 0 && coyoteBufferCounter > 0)) jump();
// Else if air jump
else if (canAirJump && jumpPressed && airJumps > 0 && !grounded && !crouchInputted)
{
	// Air jump
	jump();
	airJumps--;
}

#endregion

// Graph collisions
rbHandleGraphCollisions();

// X Tile Collisions
rbHandleXTileCollisions();

// Y Tile Collisions
rbHandleYTileCollisions();

#region Animations

var _previousSprite = sprite_index;

// If airborne
if (!grounded)
{
	if (velocity.y < 0)
	{
		// Center jump
		if (abs(velocity.x) < 0.5) sprite_index = sPlayerJumpCenter;
		// Jump
		else sprite_index = sPlayerJump;
	}
	// Cannonball (go through graphs)
	else if (crouchInputted) sprite_index = sPlayerCrouch;
	// Fall
	else sprite_index = sPlayerFall;
	
	// Set angle
	image_angle = lerp(image_angle, 0, spriteRotationSpeed);
}
else
{
	// If crouch inputted
	if (crouchInputted)
	{
		// Crouch
		if (abs(velocity.x) < 0.05) sprite_index = sPlayerCrouch;
		else
		{
			// Slide
			sprite_index = sPlayerSlide;
			if (velocity.x > 0) image_xscale = 1;
			else image_xscale = -1;
			
			// Slide sound
			if (!audio_is_playing(sfxSlide)) audio_play_sound(sfxSlide, 1, false, clamp(abs(velocity.x) * 0.75, 0, 1));
		}
	}
	// Else if inputted an x direction
	else if (xInput != 0)
	{
		// Run
		sprite_index = sPlayerRun;
		if (xInput > 0) image_xscale = 1;
		else image_xscale = -1;
	}
	// Idle
	else sprite_index = sPlayerIdle;
	
	// Set angle
	image_angle = lerp(image_angle, normal.getAngleDegrees() - 90, spriteRotationSpeed);
}

// If grounded
if (invincible && !invinciblePowerActive) image_alpha = random(1);
else image_alpha = 1;

// Reset image index if new sprite
if (sprite_index != _previousSprite) image_index = 0;

#endregion