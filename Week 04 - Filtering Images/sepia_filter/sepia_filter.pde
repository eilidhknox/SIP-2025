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
    pixels[i] = sepia(pixels[i]);
  }
  updatePixels();
}

color sepia(color pixel) {
  float r = red(pixel);
  float g = green(pixel);
  float b = blue(pixel);
  
  float outputRed = (r * .393) + (g *.769) + (b * .189);
  float outputGreen = (r * .349) + (g *.686) + (b * .168);
  float outputBlue = (r * .272) + (g *.534) + (b * .131);
  
  return color(outputRed, outputGreen, outputBlue);
}
