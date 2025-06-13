void setup() {
  size(400, 300); 
}

void draw() {
  loadPixels();  // Load the current pixel array so it can be modified

  // Retrieve the centre point of the screen
  float centerX = width / 2;
  float centerY = height / 2;

  // Calculate the maximum distance from the centre to a corner
  float maxDist = dist(0, 0, centerX, centerY);

  // Loop over every pixel column (x-axis)
  for (int x = 0; x < width; x++) {
    // Loop over every pixel row (y-axis)
    for (int y = 0; y < height; y++) {
      
      // Calculate the distance from the current pixel to the centre
      float d = dist(x, y, centerX, centerY);

      // Normalize the distance to a range from 0 (center) to 1 (farthest corner)
      float normalizedD = map(d, 0, maxDist, 0, 1);

      // Set red to decrease as distance from centre increases
      int red = int(255 * (1 - normalizedD));

      // Keep green at 0 
      int green = 0;

      // Set blue to increase as distance from centre increases
      int blue = int(255 * normalizedD);

      // Create a colour from the red, green, and blue components
      color c = color(red, green, blue);

      // Set the pixel at position (x, y) to the computed colour
      pixels[x + y * width] = c;
    }
  }

  updatePixels();  
}
