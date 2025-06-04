color colorA;
color colorB;

void setup() {
  size(700, 512);
  
  colorA = color(255, 105, 180);  // pink
  colorB = color(0, 255, 100);    // green
  
  noStroke();
}

void draw() {
  loadPixels();
  
  for (int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;
    
    // --- 2D noise with animation ---
    float noiseVal = noise(0.01 * x, 0.01 * y, frameCount * 0.01);
    
    // --- Map noise to 0-255 brightness ---
    float tone = map(noiseVal, 0, 1, 0, 255);
    
    // --- Apply duotone ---
    pixels[i] = duotone(color(tone), colorA, colorB);
  }
  
  updatePixels();
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel); // using red channel as brightness
  float lerpAmount = norm(tone, 0, 255);
  return lerpColor(colorA, colorB, lerpAmount);
}
