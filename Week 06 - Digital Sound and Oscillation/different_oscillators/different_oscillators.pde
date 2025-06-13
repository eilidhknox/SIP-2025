import processing.sound.*;

SawOsc oscillator;
LowPass filter;

void setup() {
  size(400,400);
  
  oscillator = new SawOsc(this);
  // more about filters in Processing: https://processing.org/reference/libraries/sound/index.html
  filter = new LowPass(this);
  
  filter.process(oscillator);
  
  oscillator.freq(440);
  oscillator.amp(0.5);
  
  oscillator.play();
}

void draw() {
  background(0);
}

void mouseMoved() {
  //oscillator.freq(map(mouseX,0,width,80,2000));
  oscillator.amp(map(mouseY,0,height,0.8,0));
  //filter.freq(map(mouseX,0,width,50,6000));
}
