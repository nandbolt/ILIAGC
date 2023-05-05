// Update input
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
rbUpdateGroundState();

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

// If airborne
if (!grounded) sprite_index = sPlayerAirborne;
// Else if crouch inputted
else if (crouchInputted)
{
	if (abs(velocity.x) < 0.01) sprite_index = sPlayerCrouch;
	else
	{
		sprite_index = sPlayerSlide;
		if (velocity.x > 0) image_xscale = 1;
		else image_xscale = -1;
	}
}
// Else if inputted an x direction
else if (xInput != 0)
{
	// Run animation
	sprite_index = sPlayerRunning;
	if (xInput > 0) image_xscale = 1;
	else image_xscale = -1;
}
// Else idle animation
else sprite_index = sPlayerIdle;

// If grounded
if (invincible) image_blend = c_yellow;
else if (grounded) image_blend = c_aqua;
else image_blend = c_white;

#endregion