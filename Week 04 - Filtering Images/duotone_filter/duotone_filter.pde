PImage picture;

color colorA;
color colorB;

void setup() {
  size(700, 512);
  background(0);
  picture = loadImage("sample.jpg");
  
  // blue/yellow tones
  colorA = color(2,65,166);
  colorB = color(250,182,47);
}

void draw() {
  image(picture, 0, 0);

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = duotone(pixels[i], colorA, colorB);
  }
  updatePixels();
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel);
  
  float lerpAmount = norm(tone,0,255);
  
  return lerpColor(colorA, colorB, lerpAmount);
}
