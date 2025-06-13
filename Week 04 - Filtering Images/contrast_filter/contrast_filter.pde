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
    pixels[i] = contrast(pixels[i], mouseX);
  }
  updatePixels();
}

color contrast(color pixel, float contrastAmount) {
  float r = red(pixel);
  float g = green(pixel);
  float b = blue(pixel);

  float contrastFactor = (259*(contrastAmount+255)) / (255* (259-contrastAmount));

  r = (contrastFactor * (r -128)) + 128;
  g = (contrastFactor * (g -128)) + 128;
  b = (contrastFactor * (b -128)) + 128;

  return color(r, g, b);
}
