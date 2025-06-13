

//-----INSTRUCTIONS-----//
// MOUSE X = PITCH CONTROL 
// MOUSE Y = VOLUME CONTROL


import processing.sound.*;

// Declare sine wave oscillator
SinOsc osc;

// Declare angles for planet, moon, and smaller moon
float anglePlanet = 0;
float angleMoon = 0;
float angleMoon2 = 0;

void setup() {
  // Set canvas size
  size(600, 600);
  
  // Set ellipse mode to CENTER
  ellipseMode(CENTER);

  // Initialize oscillator
  osc = new SinOsc(this);
  osc.freq(220);     // Set initial frequency
  osc.amp(0.5);      // Set initial amplitude
  osc.play();        // Start playback
}

void draw() {
  // Clear background
  background(0);

  // Map mouse Y position to oscillator amplitude (volume)
  float volume = map(mouseY, 0, height, 1.0, 0.0);
  osc.amp(volume);

  // Map mouse X position to oscillator frequency (pitch)
  float frequency = map(mouseX, 0, width, 100, 1000);
  osc.freq(frequency);

  // Generate oscillator-based modulation value
  float oscOutput = sin(frameCount * 0.02) * 0.5 + 0.5;

  // Map oscillator output to planet size
  float planetSize = map(oscOutput, 0, 1, 80, 150);

  // Move origin to canvas center
  translate(width / 2, height / 2);

  // --- Draw planet ---
  pushMatrix();
  rotate(radians(anglePlanet));
  fill(50, 150, 255);  // Blue color
  ellipse(150, 0, planetSize, planetSize);

  // --- Draw moon orbiting planet ---
  pushMatrix();
  translate(150, 0);
  rotate(radians(angleMoon));
  fill(50, 150, 255);  // Blue color
  ellipse(100, 0, 50, 50);

  // --- Draw smaller moon orbiting moon ---
  pushMatrix();
  translate(100, 0);
  rotate(radians(angleMoon2));
  fill(50, 150, 255);  // Blue color
  ellipse(60, 0, 20, 20);
  popMatrix();

  popMatrix();
  popMatrix();

  // Update angles for rotation — slowed down
  anglePlanet += 0.5;   // slower rotation
  angleMoon += 1.0;     // slower rotation
  angleMoon2 += 2.0;    // slower rotation

}
