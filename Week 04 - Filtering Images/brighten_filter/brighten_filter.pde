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
    pixels[i] = brighten(pixels[i], mouseX);
  }
  updatePixels();
}

color brighten(color pixel, float brightness) {
  float r = red(pixel);
  float g = green(pixel);
  float b = blue(pixel);

  r = r + brightness;
  g = g + brightness;
  b = b + brightness;

  return color(r, g, b);
}
