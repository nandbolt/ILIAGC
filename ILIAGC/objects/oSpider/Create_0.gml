// Inherit the parent event
event_inherited();

// Rigid body
initRigidBody();

// Inputs
inputDirection = new Vector2();

// HP
hp = 15;

// Damage
damage = 10;

// Gravity
gravityStrength = 0.05;

// Movement scalars
crawlStrength = 0.05;
graphCrawlSpeed = 0.4;
rotationSpeed = 0.05;

// Ignore graphs
ignoreGraphs = true;

// Legs
maxLegLength = 10;
legs = [	// [body position, foot position, goal position];
	[new Vector2(x+2,y+2), new Vector2(x+2,y+2), new Vector2(x,y)],
	[new Vector2(x-2,y+2), new Vector2(x-2,y+2), new Vector2(x,y)],
	[new Vector2(x-2,y-2), new Vector2(x-2,y-2), new Vector2(x,y)],
	[new Vector2(x+2,y-2), new Vector2(x+2,y-2), new Vector2(x,y)],
];