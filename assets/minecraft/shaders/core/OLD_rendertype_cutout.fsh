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
in vec4 normal;

out vec4 fragColor;

void main() {
	vec4 mapColor = vertexColor;
	if (mapColor.r > mapColor.g && mapColor.r > mapColor.b && mapColor.g < 0.2) {
		mapColor = vec4(mapColor.r, mapColor.r, mapColor.r, mapColor.a);
		mapColor *= vec4(0.98, 0.01, 0.45, 1.0);
	}
    vec4 color = texture(Sampler0, texCoord0) * mapColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
