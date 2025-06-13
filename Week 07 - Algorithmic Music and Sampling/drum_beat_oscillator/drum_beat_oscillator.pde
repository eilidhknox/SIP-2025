//-----INSTRUCTIONS-----//
// MOUSE X = PITCH CONTROL 
// MOUSE Y = VOLUME CONTROL

import processing.sound.*;

// Synth oscillator
SinOsc osc;

// Sample players
SoundFile click;
SoundFile kick;
SoundFile snare;
SoundFile clap;

float bpm = 120;  
float framesPerSecond = 60;  
float framesPerBeat = framesPerSecond * (60.0 / bpm);  

// Planet angles
float anglePlanet = 0;
float angleMoon = 0;
float angleMoon2 = 0;

void setup() {
  size(600, 600);
  ellipseMode(CENTER);

  // ---- Synthesised Sound ---- //
  osc = new SinOsc(this);
  osc.freq(220);
  osc.amp(0.5);
  osc.play();

  // ---- Looped Samples ---- //
  click = new SoundFile(this, "../samples/Clicky wood 001.wav");
  kick = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
  snare = new SoundFile(this, "../samples/snare.wav"); 
  clap = new SoundFile(this, "../samples/clap.wav"); 

  frameRate(framesPerSecond);
}

void draw() {
  background(255);  // WHITE background

  // ---- OSCILLATOR CONTROL ---- //
  float volume = map(mouseY, 0, height, 1.0, 0.0);
  osc.amp(volume);

  float frequency = map(mouseX, 0, width, 100, 1000);
  osc.freq(frequency);

  // ---- LOOPS: TRIGGER SAMPLES ---- //
  int beat = ((int)(frameCount / framesPerBeat)) % 4 + 1;

  if (frameCount % int(framesPerBeat) == 0) {
    click.play();

    if (beat == 1) {
      kick.play();
    }

    if (beat == 3) {
      snare.play();
    }
  }

  // Random clap
  if (random(1) < 0.01) {
    clap.play();
  }

  // ---- VISUALISATION ---- //

  // Planet modulated by oscillator LFO
  float oscOutput = sin(frameCount * 0.02) * 0.5 + 0.5;
  float planetSize = map(oscOutput, 0, 1, 80, 150);

  translate(width / 2, height / 2);

  // Planet
  pushMatrix();
  rotate(radians(anglePlanet));
  fill(0, 255, 100);  // GREEN
  ellipse(150, 0, planetSize, planetSize);

  // Moon
  pushMatrix();
  translate(150, 0);
  rotate(radians(angleMoon));
  fill(255, 20, 147);  // PINK
  ellipse(100, 0, 50, 50);

  // Smaller Moon
  pushMatrix();
  translate(100, 0);
  rotate(radians(angleMoon2));
  fill(0, 255, 100);  // GREEN
  ellipse(60, 0, 20, 20);
  popMatrix();

  popMatrix();
  popMatrix();

  // Update angles
  anglePlanet += 0.5;
  angleMoon += 1.0;
  angleMoon2 += 2.0;

}
