void setup() {
  size(400, 400);
  noStroke();
}

void draw() {
  background(255);
  
  int rows = 10;
  int cols = 10;
  float cellHeight = height / float(rows);
  
  float center = (cols - 1) / 2.0;
  
  // First: pre-calculate raw column widths
  float[] rawWidths = new float[cols];
  float totalRawWidth = 0;
  
  for (int col = 0; col < cols; col++) {
    float distance;
    if (col < center) {
      distance = center - col;
    } else {
      distance = col - center;
    }
    
    // Shrinking: center columns smaller
    float scaleFactor = 0.2 + (distance / center) * 0.8;
    rawWidths[col] = scaleFactor;
    totalRawWidth += scaleFactor;
  }
  
  // Now: compute final scaled widths so total = canvas width
  float[] finalWidths = new float[cols];
  for (int col = 0; col < cols; col++) {
    finalWidths[col] = (rawWidths[col] / totalRawWidth) * width;
  }
  
  // Now draw columns
  float xPos = 0;
  for (int col = 0; col < cols; col++) {
    float colWidth = finalWidths[col];
    
    for (int row = 0; row < rows; row++) {
      if ((row + col) % 2 == 0) {
        fill(0);
      } else {
        fill(255);
      }
      rect(xPos, row * cellHeight, colWidth, cellHeight);
    }
    
    xPos += colWidth;
  }
}
