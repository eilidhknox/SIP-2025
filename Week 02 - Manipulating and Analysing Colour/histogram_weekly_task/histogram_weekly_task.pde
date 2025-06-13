PImage sample;

void setup() {
  size(700, 512);
  sample = loadImage("sample.jpg");
}

void draw() {
  loadPixels();

  // 3 histograms
  int[] histogramRed = new int[256];
  int[] histogramGreen = new int[256];
  int[] histogramBlue = new int[256];

  // Loop over all pixels
  for (int i = 0; i < sample.pixels.length; i++) {

    // Get RGB values
    int redValue = int(red(sample.pixels[i]));
    int greenValue = int(green(sample.pixels[i]));
    int blueValue = int(blue(sample.pixels[i]));

    // Show original colour image
    pixels[i] = sample.pixels[i];

    // Add to histograms
    histogramRed[redValue]++;
    histogramGreen[greenValue]++;
    histogramBlue[blueValue]++;
  }

  updatePixels();

  // Draw histograms at bottom
  for (int i = 0; i < 256; i++) {
    float startHeightR = map(histogramRed[i], 0, max(histogramRed), height, height - height / 6);
    float startHeightG = map(histogramGreen[i], 0, max(histogramGreen), height, height - height / 6);
    float startHeightB = map(histogramBlue[i], 0, max(histogramBlue), height, height - height / 6);

    // Red histogram
    stroke(255, 0, 0);
    line(i, startHeightR, i, height);

    // Green histogram (shifted right by 256 px)
    stroke(0, 255, 0);
    line(i + 256, startHeightG, i + 256, height);

    // Blue histogram (shifted right by 512 px)
    stroke(0, 0, 255);
    line(i + 512, startHeightB, i + 512, height);
  }
}
