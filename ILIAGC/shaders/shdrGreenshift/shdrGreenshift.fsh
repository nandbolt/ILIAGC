//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Invert color
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	color.r -= 0.6;
	color.b -= 0.6;
	
	// Set color
    gl_FragColor = color;
}
