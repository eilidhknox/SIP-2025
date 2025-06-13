PVector mousePos;

float centreX;
float centreY;

// use negative scaling to mirror objects
float lineScale = -1;
 
void setup() {
  size(800, 800);
  mousePos = new PVector(0, 0);
  centreX = width / 2.;
  centreY = height / 2;
}

void draw() {
  translate(centreX, centreY);
  background(220);
  mousePos.x = mouseX - centreX;
  mousePos.y = mouseY - centreY;
  
  mousePos.mult(lineScale);
  
  line(0, 0, mousePos.x, mousePos.y);
}
