// Update inputs
inputDirection.x = inputHeld(playerId, InputAction.RIGHT) - inputHeld(playerId, InputAction.LEFT);
inputDirection.y = inputHeld(playerId, InputAction.DOWN) - inputHeld(playerId, InputAction.UP);
jumpInputted = inputHeld(playerId, InputAction.JUMP);
jumpPressed = inputPressed(playerId, InputAction.JUMP);
crouchInputted = inputHeld(playerId, InputAction.DOWN);
interactPressed = inputPressed(playerId, InputAction.INTERACT);

// Ignore graphs
if (crouchInputted && jumpInputted) ignoreGraphs = true;
else ignoreGraphs = false;

// Block place
if (blocks > 0 && inputPressed(playerId, InputAction.INTERACT))
{
	// Spawn block if empty space
	var _x = floor(x / TILE_SIZE) * TILE_SIZE, _y = floor(y / TILE_SIZE) * TILE_SIZE + TILE_SIZE;
	if (tilemap_get_at_pixel(collisionTiles, _x, _y) == 0) spawnBlock(_x, _y);
}

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
		if (invinciblePowerTimer <= 0)
		{
			invinciblePowerActive = false;
			deathTouch = false;
		}
		else invinciblePowerTimer--;
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
else if (inputDirection.x != 0) groundConstant = runGroundConstant;
else if (!jumpPressed && jumpInputted) groundConstant = holdGroundConstant;
else groundConstant = idleGroundConstant;
rbHandleResistances();

// Apply input to velocity
var _moveStrength = runStrength;
if (crouchInputted) _moveStrength = 0;
if (!grounded) _moveStrength = driftStrength;
velocity.x += inputDirection.x * _moveStrength;

// Gravity
gravityStrength = normalGravityStrength;
if (shield == 3) gravityStrength *= 0.4;
else if (shield == 2) gravityStrength *= 0.6;
else if (shield == 1) gravityStrength *= 0.8;
rbApplyGravity();

#region Jump

// Set jump buffer counter
if (jumpPressed && !crouchInputted) jumpBufferCounter = jumpBuffer;
else jumpBufferCounter = clamp(jumpBufferCounter - 1, 0, jumpBuffer);

// If jump buffered 
if (jumpBufferCounter > 0)
{
	// Ground jump
	if (grounded || coyoteBufferCounter > 0) jump();
	// Air jump
	else if (airJumps > 0) airJump();
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
	else if (inputDirection.x != 0)
	{
		// Run
		sprite_index = spriteRun;
		if (inputDirection.x > 0) image_xscale = 1;
		else image_xscale = -1;
	}
	// Idle
	else sprite_index = spriteIdle;
	
	// Set angle
	image_angle = lerp(image_angle, normal.getAngleDegrees() - 90, spriteRotationSpeed);
}

// Check flashing alpha
if ((invincible && (!invinciblePowerActive || invinciblePowerTimer < 180)) ||	// Damage invincibility
	(collisionType == Collision.BOUNCE && bubbleGumTimer < 180) ||	// Sticky 3 sec
	(false)) image_alpha = random(1);
else image_alpha = 1;

// Reset image index if new sprite
if (sprite_index != _previousSprite) image_index = 0;

// Bubble gum
if (bubbleGumTimer > 0) image_blend = c_fuchsia;
else image_blend = playerColor;

#endregion