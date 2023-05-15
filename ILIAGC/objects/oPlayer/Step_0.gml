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

#region Powerups/Invincibility/Other

// Switch scopes
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Bubble gum timer
	if (bubbleGumTimer > 0) bubbleGumTimer--;
	else collisionType = Collision.SLIDE;
	
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
if (crouchInputted) groundConstant = slideGroundConstant;
else if (xInput != 0) groundConstant = runGroundConstant;
else if (!jumpPressed && jumpInputted) groundConstant = holdGroundConstant;
else groundConstant = idleGroundConstant;
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
else
{
	// If block set
	if (blocks > 0 && jumpPressed)
	{
		// If at empty space
		var _x = floor(x / TILE_SIZE) * TILE_SIZE, _y = floor(y / TILE_SIZE) * TILE_SIZE + TILE_SIZE;
		if (tilemap_get_at_pixel(collisionTiles, _x, _y) == 0)
		{
			// Set block
			instance_create_layer(_x, _y, "Instances", oBlock);
			blocks--;
			
			// Block sound
			audio_play_sound(sfxGraphEquation, 1, false);
		}
	}
	
	// If air jump
	if (canAirJump && jumpPressed && airJumps > 0 && !grounded && !crouchInputted)
	{
		// Air jump
		jump();
		airJumps--;
	}
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
		if (abs(velocity.x) < 0.5) sprite_index = spriteJumpCenter;
		// Jump
		else
		{
			sprite_index = spriteJump;
			if (velocity.x > 0) image_xscale = 1;
			else image_xscale = -1;
		}
	}
	// Cannonball (go through graphs)
	else if (crouchInputted) sprite_index = spriteCrouch;
	// Fall
	else sprite_index = spriteFall;
	
	// Set angle
	image_angle = lerp(image_angle, 0, spriteRotationSpeed);
}
else
{
	// If crouch inputted
	if (crouchInputted)
	{
		// Crouch
		if (abs(velocity.x) < 0.05) sprite_index = spriteCrouch;
		else
		{
			// Slide
			sprite_index = spriteSlide;
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
		sprite_index = spriteRun;
		if (xInput > 0) image_xscale = 1;
		else image_xscale = -1;
	}
	// Idle
	else sprite_index = spriteIdle;
	
	// Set angle
	image_angle = lerp(image_angle, normal.getAngleDegrees() - 90, spriteRotationSpeed);
}

// If grounded
if (invincible && !invinciblePowerActive) image_alpha = random(1);
else image_alpha = 1;

// Reset image index if new sprite
if (sprite_index != _previousSprite) image_index = 0;

// Bubble gum
if (bubbleGumTimer > 0) image_blend = c_fuchsia;
else image_blend = c_white;

#endregion