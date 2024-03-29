// Upkeep
tutorialIdx = 0;
tutorialText = "Hey! So... looks like you live in this graphing calculator now. How'd you get here, anyways? No matter, I'll try to get you up to speed on how things work.\n\nCollect the coin to continue.";

/// @func	progressTutorial();
progressTutorial = function()
{
	switch (tutorialIdx)
	{
		case 0:
			tutorialText = "Let's start with movement. To move around, use the keys A and D. Press Spacebar to jump.";
			break;
		case 1:
			tutorialText = "To crouch, use S. You can slide if you move and press S, or if you're on an incline.";
			break;
		case 2:
			tutorialText = "It's time to start learning how to graph math equations, or EQs! Once you learn the in's and out's of graphing, you'll be set!\n\nLet's get started.";
			break;
		case 3:
			tutorialText = "To graph an EQ:\n\n1)Open the EQ Editor with Tab.\n\n2)Type a valid EQ and press Enter to graph it! You can use the left/right arrows to go to Menu 2 to see valid tokens. Menu 3 has example EQs that could be of use.\n\n3) Once an EQ is graphed, exit out of the EQ Editor with Tab.\n\nTry to use a graph to help you collect the next coin (y=2 could work...).";
			break;
		case 4:
			tutorialText = "Mathematical! To go through your graph, hold crouch and press the jump button.\n\nYou can also destroy your graph by pressing Spacebar while in the EQ Editor.";
			break;
		case 5:
			tutorialText = "This is a graph eater. It... eats graphs. They're safe to touch, though, and give you a movement boost! Graph around them if you can.";
			instance_create_layer(96,144,"Instances",oGraphEater);
			oGraphEater.fadeCounter = oGraphEater.fadeTime;
			break;
		case 6:
			tutorialText = "You can graph 2 EQs at once. To switch between EQs, use up/down arrows while in the EQ editor.\n\nSwitch to y2 and use 2 graphs to get to the next coin!";
			instance_destroy(oGraphEater);
			for (var _x = 24; _x < 180; _x += 12)
			{
				instance_create_layer(_x,128,"Instances",oGraphEater);
			}
			oGraphEater.fadeCounter = oGraphEater.fadeTime;
			break;
		default:
			instance_destroy(oObstacle);
			tutorialText = "I think you're ready! You can use numbers, x, and various operators like +, -, *, /, sine, cosine, log, square roots, and so on in your equations. You can use parentheses to make sure of the order.\n\nFeel free to leave at any time.\n\nSome useful EQs are:\ny = 2\ny = x\ny = sin(x)+2\ny = 9/x";
	}
	tutorialIdx++;
}

/// @func endTutorial();
endTutorial = function()
{
	// Destroy all game objects
	instance_destroy(oCollectable);
	instance_destroy(oObstacle);
	
	with (oWorld)
	{
		// Add coins to the bank/reset
		coinsInBank += coins;
		coins = 0;
	}
	
	instance_destroy();
}

// Spawn first coin
with (instance_create_layer(128,168,"Instances",oCoinTutorial))
{
	activate();
}