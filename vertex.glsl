#version 300 es
uniform mat4 u_mvpMatrix;
layout(location = 0) in vec3 a_Position;
layout(location = 1) in float a_offset;   // сдвиг по глубине (в единицах clip-пространства)

// Модуль сдвига по глубине в оконных координатах [0, 1].
// Направление сдвига (к камере / от камеры) выбирается во фрагментном
// шейдере по gl_FrontFacing, которое в вершинном шейдере недоступно.
out highp float v_depthOffset;

void main() {
  vec4 pos = u_mvpMatrix * vec4(a_Position, 1.0);
  gl_Position = pos;
  // z_win = 0.5 * z_clip / w + 0.5  =>  Δz_win = 0.5 * Δz_clip / w
  v_depthOffset = 0.5 * abs(a_offset) / pos.w;
}
