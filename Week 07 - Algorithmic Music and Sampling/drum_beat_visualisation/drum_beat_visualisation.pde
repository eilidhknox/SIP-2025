import processing.sound.*;

SoundFile click;
SoundFile kick;
SoundFile snare;
SoundFile clap;

float bpm = 120;  // beats per minute
float framesPerSecond = 60;  // Smooth visuals
float framesPerBeat = framesPerSecond * (60.0 / bpm);  // e.g. 60 * (60/120) = 30 frames per beat

void setup() {
  size(640, 360);
  background(255);  // WHITE background
  
  // Load sounds
  click = new SoundFile(this, "../samples/Clicky wood 001.wav");
  kick = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
  snare = new SoundFile(this, "../samples/snare.wav"); 
  clap = new SoundFile(this, "../samples/clap.wav"); 
  
  frameRate(framesPerSecond);
}

void draw() {
  background(255);  // PURE WHITE background
  
  // Calculate beat number in 4/4
  int beat = ((int)(frameCount / framesPerBeat)) % 4 + 1;
  
  // Trigger sounds at exact frame
  if (frameCount % int(framesPerBeat) == 0) {
    // Play "Click" on every beat
    click.play();
    
    // Kick on beat 1
    if (beat == 1) {
      kick.play();
    }
    
    // Snare on beat 3
    if (beat == 3) {
      snare.play();
    }
  }
  
  // Random Clap ANYTIME (not just beat 4)
  if (random(1) < 0.01) {  // ~1% chance per frame
    clap.play();
  }
  
  // ---- AUDIO REACTIVE VISUALIZATION ---- //
  
  // Pulse size based on beat
  float pulse = 0;
  if (frameCount % int(framesPerBeat) < 5) {  // shortly after beat trigger
    pulse = 100;
  }
  
  // Draw central pulsing circle
  
  // Glow layer — PINK
  noStroke();
  fill(255, 20, 147, 100);  // PINK glow
  ellipse(width/2, height/2, 200 + pulse, 200 + pulse);
  
  // Foreground bubble — GREEN
  stroke(0, 255, 100);
  strokeWeight(4);
  fill(0, 255, 100, 150);  // GREEN
  ellipse(width/2, height/2, 150 + pulse * 0.8, 150 + pulse * 0.8);
  
  // Beat indicator (1 to 4)
  fill(255, 20, 147);  // PINK text
  textSize(64);
  textAlign(CENTER, CENTER);
  text(beat, width/2, height/2);
}
