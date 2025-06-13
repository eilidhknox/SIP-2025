float angleOne = 0;
float angleTwo = 0;

float xpos = 80;
float xstep = 60;

void setup() {
  size(400, 400);
  rectMode(CENTER);
}

void draw() {
  background(0);
  pushMatrix();
    fill(153,50,204);
    translate(xpos + (xstep * 0), height/2);
    rotate(radians(angleOne));
    rect(0, 0, 50, 50); // notice the position is 0,0
    angleOne = angleOne + 1;
  popMatrix();
  
  pushMatrix();
    fill(153,50,204);
    translate(xpos + (xstep * 1), height/2);
    rotate(radians(angleTwo));
    rect(0, 0, 50, 50); // notice the position is 0,0
    angleTwo = angleTwo + 1;
  popMatrix();
}
