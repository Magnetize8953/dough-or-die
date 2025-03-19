// fragment shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// this comes from the object calling the shader
uniform float u_rgb[3]; 
 

void main()
{
	vec4 texColour = texture2D(gm_BaseTexture, v_vTexcoord);
    // overlay colours
    if (u_rgb[0] == 0.0 && u_rgb[1] == 0.0 && u_rgb[2] == 0.0) { // no shading
        gl_FragColor = texColour; // return default texture
    } else { // overlay colour was given
		//gl_FragColor = mix(texColour, vec4(1.0, 0.0, 0.0, texColour.a), 0.5); // Tint red
        gl_FragColor = v_vColour * mix(texColour, vec4(u_rgb[0], u_rgb[1], u_rgb[2], texColour.a), 0.75);
		//gl_FragColor = texColour; // Should show the tile layer as normal
	}
	
}
