//
// Inverse sepia fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	color.rgb = 1.0 - color.rgb;
	
	mat3 sepiaMatrix = mat3(
		0.393, 0.769, 0.189,
		0.349, 0.686, 0.168,
		0.272, 0.534, 0.131
	);
	
	vec3 sepiaColor = color.rgb * sepiaMatrix;
	
    gl_FragColor.rgb = mix(color.rgb, sepiaColor, 1.0);
	gl_FragColor.a = color.a;
}
