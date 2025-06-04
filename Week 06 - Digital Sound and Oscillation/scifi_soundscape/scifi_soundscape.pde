// Import the Processing Sound library
import processing.sound.*;

// Declare oscillators
SinOsc sine;   // Sine wave oscillator — smooth tone
SawOsc saw;    // Sawtooth oscillator — buzzy tone

// Declare filters
LowPass lowpass;   // Low-pass filter — removes high frequencies
BandPass bandpass; // Band-pass filter — keeps a narrow range of frequencies

void setup() {
  // Set size of window
  size(640, 360);
  
  // Set background color to black
  background(0);
  
  // Create oscillators
  sine = new SinOsc(this); // Create sine oscillator
  saw = new SawOsc(this);  // Create sawtooth oscillator
  
  // Create filters
  lowpass = new LowPass(this);   // Create low-pass filter
  bandpass = new BandPass(this); // Create band-pass filter
  
  // Start sine oscillator:
  // Set frequency to 200 Hz
  sine.freq(200);
  
  // Set amplitude (volume) to 0.3 (range is 0 to 1)
  sine.amp(0.3);
  
  // Play the sine wave
  sine.play();
  
  // Start sawtooth oscillator:
  // Set frequency to 100 Hz
  saw.freq(100);
  
  // Set amplitude to 0.2
  saw.amp(0.2);
  
  // Play the sawtooth wave
  saw.play();
  
  // Apply low-pass filter to the saw oscillator
  // This will filter (shape) the saw sound
  lowpass.process(saw);
}

void draw() {
  // Clear background each frame
  background(0);
  
  // Modulate the sine oscillator frequency using a sine wave:
  // This creates a slowly changing "alien" tone
  float mod = sin(frameCount * 0.01); // frameCount is the current frame number
  sine.freq(200 + mod * 50);          // Modulate around 200 Hz
  
  // Modulate lowpass filter cutoff frequency:
  // This creates a "breathing" effect in the sound
  lowpass.freq(500 + sin(frameCount * 0.02) * 400);
  
  // Modulate bandpass filter (not connected here — would work if connected to another oscillator)
  bandpass.freq(1000 + sin(frameCount * 0.05) * 800);
  
// Display text on screen
fill(255); // White text
textAlign(CENTER, BOTTOM); // Center horizontally, align to bottom
text("Sci-Fi Arrival Sound", width / 2, height - 40);
text("Move mouse to control sound", width / 2, height - 20);

}

void mouseMoved() {
  // Use mouse Y position to control volume:
  // Top of screen → louder, bottom → quieter
  float amp = map(mouseY, 0, height, 0.5, 0);
  
  // Adjust sine oscillator amplitude
  sine.amp(amp * 0.3);
  
  // Adjust saw oscillator amplitude
  saw.amp(amp * 0.2);
}

//---OSCILLATORS---//
// SinOsc https://processing.org/reference/libraries/sound/SinOsc.html
// SawOsc https://processing.org/reference/libraries/sound/SawOsc.html

//---FILTERS---//
//LowPass https://processing.org/reference/libraries/sound/LowPass.html
//BandPass https://processing.org/reference/libraries/sound/BandPass.html
