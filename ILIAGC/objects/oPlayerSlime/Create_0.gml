// Inherit the parent event
event_inherited();

// Movement scalars
runStrength = 0.05;
driftStrength = 0.08;

// Jumping
jumpStrength = 4;

// Sprites
spriteIdle = sSlimeIdle;
spriteRun = sSlimeRun;
spriteJump = sSlimeJump;
spriteFall = sSlimeFall;
spriteJumpCenter = sSlimeJumpCenter;
spriteSlide = sSlimeSlide;
spriteCrouch = sSlimeCrouch;

// Update theme
updateTheme(oWorld.currentTheme);