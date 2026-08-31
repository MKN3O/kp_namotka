#version 300 es
uniform mat4 u_mvpMatrix;
layout(location = 0) in vec3 a_Position;
layout(location = 1) in float a_offset;

void main() {
  vec4 pos = u_mvpMatrix * vec4(a_Position, 1.0);
  pos.z += a_offset;
  gl_Position = pos;
}