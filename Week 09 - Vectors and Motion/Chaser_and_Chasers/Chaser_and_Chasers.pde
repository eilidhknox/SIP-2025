class Chaser {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float heading;
  
  color col;
  
  Chaser(float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    col = color(random(255),random(255),random(255));
  }
  
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    
    PVector direction = PVector.sub(mouse,position);
    
    direction.normalize();
    direction.mult(0.2);
    
    acceleration = direction;
    
    
    velocity.add(acceleration);
    velocity.limit(10);
    
    // setting heading to velocity gives us something
    // a little like 'steering';
    // setting heading to acceleration gives us something
    // less realistic but snappier.
    heading = velocity.heading() + PI/2;
    
    position.add(velocity);
  }
  
  void display() {
    stroke(64);
    strokeWeight(2);
    fill(col);

    pushMatrix();
    
    translate(position.x,position.y);
    rotate(heading);
    
    // asteroids ship
    beginShape();
    vertex(0,-20);
    vertex(15,10);
    vertex(0,0);
    vertex(-15,10);   
    endShape(CLOSE);
    
    popMatrix();
  }
}

Chaser[] chasers;
int chaserCount = 10;

void setup() {
  size(800, 600);

  chasers = new Chaser[chaserCount];

  for (int i = 0; i < chasers.length; i++) {
    chasers[i] = new Chaser(random(width), random(height));
  }
}

void draw() {
  background(128);

  for (Chaser chaser : chasers) {
    chaser.update();
    chaser.display();
  }
}

void mousePressed() {
  setup();
}
