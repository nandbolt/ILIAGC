// Self
draw_self();

// Vectors
draw_line_color(x,y,x+velocity.x*5,y+velocity.y*5,c_lime,c_lime);
draw_line_color(x,y,x+normal.x*10,y+normal.y*10,c_yellow,c_yellow);

// Hitbox
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

// Origin
draw_circle(x-0.5, y-0.5, 1, false);