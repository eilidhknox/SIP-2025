import processing.sound.*;

SoundFile sample1;
SoundFile sample2;
SoundFile sample3;
SoundFile sample4;

float bpm = 120; // beats per minute

float myFrameRate = bpm / 40; // frame rate = beats per second

void setup() {
  size(640, 360);
  background(255);
  
  sample1 = new SoundFile(this, "../samples/Clicky wood 001.wav");
  sample2 = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
  sample3 = new SoundFile(this, "../samples/snare.wav"); 
  sample4 = new SoundFile(this, "../samples/clap.wav"); 
  
  frameRate(myFrameRate);
}

void draw() {
  background(random(255), random(255), random(255));
  
   int beat = (frameCount - 1) % 4 + 1;  // 1 to 4
  
  // play every beat
  sample1.play();
  
  //// play every fourth beat
  if (beat == 1) {
    sample2.play();
  }
  
   if (beat == 3) {
    sample3.play();
   }
   
     if (frameCount % 4 == 0 && random(1) >= 0.5) {
    sample4.play();
  }
}
