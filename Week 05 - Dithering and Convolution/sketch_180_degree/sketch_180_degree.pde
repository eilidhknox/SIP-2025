import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);
  
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
    // Rotate 180 degrees by reversing the pixel order
    pixels[i] = cam.pixels[cam.pixels.length - 1 - i];
  }

  updatePixels();
}
