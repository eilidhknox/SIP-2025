class LeafEmitter {
  ArrayList<Particle> particles;
  PVector origin;
  int emitRate;
  
  LeafEmitter(float x, float y, int rate) {
    origin = new PVector(x, y);
    emitRate = rate;
    particles = new ArrayList<Particle>();
  }
  
  void run() {
    for (int i = 0; i < emitRate; i++) {
      addParticle();
    }
    
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      if (p.isOffScreen()) {
        particles.remove(i);
      }
    }
  }
  
  void addParticle() {
    float offsetX = random(-50, 50);
    particles.add(new Particle(new PVector(origin.x + offsetX, origin.y)));
  }
  
  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }
}
