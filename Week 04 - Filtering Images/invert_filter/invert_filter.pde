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
    pixels[i] = invert(pixels[i]);
  }
  updatePixels();
}

color invert(color pixel) {
  float r = red(pixel);
  float g = green(pixel);
  float b = blue(pixel);

  r = 255-r;
  g = 255-g;
  b = 255-b;

  return color(r, g, b);
}
