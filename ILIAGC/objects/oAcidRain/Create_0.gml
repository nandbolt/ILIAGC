// Inherit the parent event
event_inherited();

// Rigid body
initRigidBody();

// HP
hp = 3;

// Gravity
gravityStrength = 0.05;

// Resistances
airConstant = 0.003;
groundConstant = 0;

// Damage
damage = 5;

// Alpha
image_alpha = 0.5;

// Init random x velocity
velocity.x = random_range(-0.1,0.1);