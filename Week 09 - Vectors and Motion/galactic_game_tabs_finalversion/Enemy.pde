class Enemy {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float heading;
  color col;
  
  Enemy(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    col = color(255, 0, 0);
  }
  
  void update(Player target) {
    PVector direction = PVector.sub(target.position, position);
    direction.normalize();
    direction.mult(0.2);
    
    acceleration = direction;
    
    float jitterAmount = 0.5;
    acceleration.x += random(-jitterAmount, jitterAmount);
    acceleration.y += random(-jitterAmount, jitterAmount);
    
    velocity.add(acceleration);
    velocity.limit(5);
    
    heading = velocity.heading() + PI/2;
    
    position.add(velocity);
  }
  
  void display() {
    stroke(64);
    strokeWeight(2);
    fill(col);
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(heading);
    
    beginShape();
    vertex(0, -20);
    vertex(15, 10);
    vertex(0, 0);
    vertex(-15, 10);   
    endShape(CLOSE);
    
    popMatrix();
  }
  
  boolean checkCollision(Player p) {
    float d = PVector.dist(position, p.position);
    return d < (p.size/2 + 15);
  }
}
