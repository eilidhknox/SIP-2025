import processing.video.*;

Capture cam;

color colorA;
color colorB;

float angle = 0;

void setup() {
  size(640, 480);
  
  colorA = color(255, 105, 180); // pink
  colorB = color(0, 255, 100);   // green
  
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if (cam.available()) {
    cam.read();
  }

  loadPixels();
  cam.loadPixels();

  for (int i = 0; i < cam.pixels.length; i++) {
    float greyValue = red(cam.pixels[i]);
    float newPixelValue = (greyValue > 127) ? 255 : 0;
    float error = greyValue - newPixelValue;

    color ditheredPixel = color(newPixelValue);
    pixels[i] = duotone(ditheredPixel, colorA, colorB);

    fsDither(i, error);
  }

  updatePixels();

  // Rotate the whole screen
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  translate(-width/2, -height/2);
  image(get(), 0, 0);
  popMatrix();

  // Increment angle
  angle += 0.01;
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel);
  float lerpAmount = norm(tone, 0, 255);
  return lerpColor(colorA, colorB, lerpAmount);
}

void fsDither(int i, float error) {
  int[] offsets = { 1, width - 1, width, width + 1 };
  float[] ratios = { 7/16.0, 3/16.0, 5/16.0, 1/16.0 };

  for (int j = 0; j < offsets.length; j++) {
    int n = i + offsets[j];
    if (n < cam.pixels.length) {
      float neighbourGrey = red(cam.pixels[n]);
      cam.pixels[n] = color(neighbourGrey + error * ratios[j]);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("frame-######.jpg");
  }
}
