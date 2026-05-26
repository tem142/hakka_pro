// 現状実行部とsynth部を分けている

import ddf.minim.*;
import ddf.minim.ugens.*;




Minim minim;
AudioOutput out;
WaveVisualizer vis;

void setup() {
  size(800, 400);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  out.setTempo(120); 
  tromboneWave = WavetableGenerator.gen10(
    4096,
    new float[] {1.0f, 0.0f, 0.32f, 0.2f, 0.1f}
  );
  
  vis = new WaveVisualizer(out);
}

void draw() {
  background(0);
  // 「音の担当」が鳴らしている out を、「見た目の担当」に渡して描画
  vis.drawWave(out); 
}

void keyPressed() {
  if (key == 'p') playSong();
}
