color[][] circleColours; // Array to store colours
int rows, cols;
int spacing = 80;

void setup() {
  size(400, 400);
  noStroke();

  cols = width / spacing;
  rows = height / spacing;
  
  circleColours = new color[rows][cols];
  
  // Generate colours once
  generateColours();
}

void draw() {
  background(0);
  
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      
      // Use stored colour — no flicker!
      fill(circleColours[row][col]);
      
      float x = col * spacing + spacing/2;
      float y = row * spacing + spacing/2;
      ellipse(x, y, 70, 70);
    }
  }
}

void generateColours() {
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      
      if ((row + col) % 2 == 0) {
        // Random pink shade
        circleColours[row][col] = color(
          random(200, 255), // R
          random(50, 150),  // G
          random(150, 255)  // B
        );
      } else {
        // Random green shade
        circleColours[row][col] = color(
          random(0, 50),    // R
          random(150, 255), // G
          random(0, 50)     // B
        );
      }
    }
  }
}

// Optional: press space to re-randomise
void keyPressed() {
  if (key == ' ') {
    generateColours();
  }
}
