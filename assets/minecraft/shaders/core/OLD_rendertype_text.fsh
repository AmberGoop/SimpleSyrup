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

out vec4 fragColor;

bool roughly_equal(float num1, float num2, float threshold) {
    return abs(num1 - num2) <= threshold;
}

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
	if (roughly_equal(color.r, 0.49, 0.01) && roughly_equal(color.g,0.99,0.01) &&roughly_equal(color.b, 0.13, 0.01)) {
	 color = vec4(1,0.8,0.9,1.0);
	}
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
