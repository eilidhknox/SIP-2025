PImage picture;

void setup() {
  size(700, 512);
  background(0);
  picture = loadImage("sample.jpg");
}

void draw() {
  loadPixels();
  picture.loadPixels();

  float radius = 100; // size of mask

  for (int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;

    float d = dist(x, y, mouseX, mouseY);

    color c = picture.pixels[i];

    if (d < radius) {
      // Inside mask → invert
      pixels[i] = invert(c);
    } else {
      // Outside mask → threshold
      pixels[i] = threshold(c, 100);
    }
  }

  updatePixels();
}

color invert(color pixel) {
  float r = red(pixel);
  float g = green(pixel);
  float b = blue(pixel);

  r = 255 - r;
  g = 255 - g;
  b = 255 - b;

  return color(r, g, b);
}

color threshold(color pixel, int threshold) {
  float bright = (red(pixel) + green(pixel) + blue(pixel)) / 3;

  if (bright > threshold) {
    return color(255);
  } else {
    return color(0);
  }
}
