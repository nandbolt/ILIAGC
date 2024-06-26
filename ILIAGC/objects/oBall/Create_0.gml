// Rigid body
initRigidBody();

// Rotation
imageAngle = image_angle;
rotationSpeed = 0;

// Bounce
collisionType = Collision.BOUNCE;

// Gravity
gravityStrength = 0.05;

// Resistances
airConstant = 0.003;
groundConstant = 0.01;

// Lifetime
lifeTime = oGame.myPowerups[Powerup.BALL][1] * 30 * 60;

// States
invincible = false;
if (oGame.myPowerups[Powerup.BALL][1] > 1) invincible = true;

// Kick
kickTimer = 0;
kickTime = 20;
kickRotationSpeed = 10;

// Sprite
ballSprite = sBall;

/// @func	resetKick();
resetKick = function()
{
	rotationSpeed = lerp(rotationSpeed, 0, 0.05);
	ignoreGraphs = false;
}