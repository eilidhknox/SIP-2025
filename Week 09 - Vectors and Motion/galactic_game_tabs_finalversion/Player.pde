class Player {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size = 30;
  
  Player(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    
    float jitterAmount = 0.1;
    velocity.x += random(-jitterAmount, jitterAmount);
    velocity.y += random(-jitterAmount, jitterAmount);
    
    float drag = 0.97;
    velocity.mult(drag);
    
    position.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }
  
  void display() {
    fill(0, 200, 255);
    stroke(255);
    ellipse(position.x, position.y, size, size);
  }
  
  void checkEdges() {
    if (position.x < 0) {
      position.x = 0;
      velocity.x *= -0.5;
    }
    if (position.x > width) {
      position.x = width;
      velocity.x *= -0.5;
    }
    if (position.y < 0) {
      position.y = 0;
      velocity.y *= -0.5;
    }
    if (position.y > height) {
      position.y = height;
      velocity.y *= -0.5;
    }
  }
}
