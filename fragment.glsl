#version 300 es
precision highp float;
uniform vec3 u_Color;
in float v_depthOffset;
out vec4 fragColor;

void main() {
  fragColor = vec4(u_Color, 1.0);
  if (gl_FrontFacing) {
    fragColor.rgb *= 1.0; // Цвет для лицевой стороны. Добавлено для теста
    float d = -v_depthOffset;
  } else {
    fragColor.rgb *= 0.5;
    float d = v_depthOffset;
  }

  // Лицевые фрагменты приближаем к камере, нелицевые – отдаляем.
  // Для линий и точек gl_FrontFacing всегда true (приближаются).
  gl_FragDepth = clamp(gl_FragCoord.z + d, 0.0, 1.0);
}
