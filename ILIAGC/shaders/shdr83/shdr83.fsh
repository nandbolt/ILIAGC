//
// 83 fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Gray
    vec4 texColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
	
	// Invert gray
	vec3 invertColor = vec3(1.0 - gray, 1.0 - gray, 1.0 - gray);
	
	// TI-83 background color
	vec3 ti83bgColor = vec3(0.565, 0.608, 0.388);
	
	// Multiply colors
    gl_FragColor = vec4(invertColor * ti83bgColor, texColor.a);
}
