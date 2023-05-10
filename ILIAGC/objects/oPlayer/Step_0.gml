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

#region Invincibility

// Switch scopes
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Update invincibility if invincible
	if (invincible)
	{
		if (invincibleTimer <= 0) invincible = false;
		else invincibleTimer--;
	}
}

#endregion

#region Ground State

// Update ground state
var _wasGrounded = grounded;
rbUpdateGroundState();

// If landed
if (!_wasGrounded && grounded)
{
	// Land sound
	audio_play_sound(sfxLand, 1, false);
}

// Set coyote buffer
if (!grounded) coyoteBufferCounter = clamp(coyoteBufferCounter-1,0,coyoteBuffer);
else coyoteBufferCounter = coyoteBuffer;

#endregion

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

// If jump buffered and grounded or jump buffered and coyote ready
var _jumpFrame = false;
if ((jumpBufferCounter > 0 && grounded) || (jumpBufferCounter > 0 && coyoteBufferCounter > 0))
{
	// Apply jump
	velocity.y = -jumpStrength;
	
	// Reset jump
	jumpBufferCounter = 0;
	coyoteBufferCounter = 0;
	_jumpFrame = true;
	
	// Jump particles
	with (oParticles)
	{
		part_particles_create(partSystem, other.x, other.y, partTypeDust, 2);
	}
	
	// Jump sound
	audio_play_sound(sfxJump, 2, false);
}

#endregion

// Graph collisions
rbHandleGraphCollisions();

// X Tile Collisions
rbHandleXTileCollisions();

// Update x
x += velocity.x;
graphPosition.x = convertXToGraphX(x);

// Y Tile Collisions
rbHandleYTileCollisions();

// Update y
y += velocity.y;
graphPosition.y = convertYToGraphY(y);
//show_debug_message("Position: " + string(x) + "," + string(y));
//show_debug_message("Graph position: " + string(graphPosition));

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
if (invincible) image_alpha = random(1);
else image_alpha = 1;

// Reset image index if new sprite
if (sprite_index != _previousSprite) image_index = 0;

#endregion