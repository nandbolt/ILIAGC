//
// Invert fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Invert color
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	bool grey = (color.r == color.g) && (color.r == color.b);
	if (grey)
	{
		color.rgb = 1.0 - color.rgb;
	}
	
	// Set color
    gl_FragColor = color;
}
