var _x = 0, _y = 0;

var _s = 0.25, _yoff = 4;

// Player
if (instance_exists(oPlayer))
{
	with (oPlayer)
	{
		// Vectors
		draw_line_color(x,y,x+velocity.x*5,y+velocity.y*5,c_lime,c_lime);
		draw_line_color(x,y,x+normal.x*10,y+normal.y*10,c_yellow,c_yellow);

		// Hitbox
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

		// Origin
		draw_circle(x-0.5, y-0.5, 1, false);
		
		// Player stats
		if (!oGrapher.editingEquation)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			_x = 22;
			_y = 31;
			draw_set_color(c_gray);
			draw_text_transformed(_x, _y, "Player", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Grounded: " + string(grounded), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "World Pos: (" + string(x) + ", " + string(y) + ")", _s, _s, 0);
			_y += _yoff;
			var _graphX = convertXToGraphX(x);
			draw_text_transformed(_x, _y, "Graph Pos: (" + string(_graphX) + ", " + string(convertYToGraphY(y)) + ")", _s, _s, 0);
			_y += _yoff;
			
			// If graphs exist
			if (instance_exists(oGraph))
			{
				with (oGraph)
				{
					// Show output
					draw_text_transformed(_x, _y, "y" + string(graphIdx + 1) + "(x) = " + string(getGraphOutput(_graphX)), _s, _s, 0);
					_y += _yoff;
				}
			}
			draw_set_color(c_white);
		}
	}
}

// Collectables
if (instance_exists(oCollectable))
{
	with (oCollectable)
	{
		// Hitbox
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
}

// Obstacles
if (instance_exists(oObstacle))
{
	with (oObstacle)
	{
		// Hitbox
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
}

// Ball
if (instance_exists(oBall))
{
	with (oBall)
	{
		// Hitbox
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
}

// Grapher
if (instance_exists(oGrapher))
{
	with (oGrapher)
	{
		if (editingEquation && showInfo)
		{
			// Alignment
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			// Previous Postfix Equation
			draw_set_color(c_gray);
			draw_text_transformed(22, 164,"Postfix EQ: " + previousPostfixEquation, 0.5, 0.5, 0);
			draw_set_color(c_white);
		}
	}
}