#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec4 normal;

out vec4 fragColor;

bool roughly_equal(float num1, float num2, float threshold) {
    return abs(num1 - num2) <= threshold;
}

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
	
	 color = vec4(1,0.8,0.9,1.0);
	
	
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
