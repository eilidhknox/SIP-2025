ArrayList<LeafEmitter> emitters;
PVector globalWind;

void setup() {
  size(800, 600);
  
  emitters = new ArrayList<LeafEmitter>();
  emitters.add(new LeafEmitter(width/2, -20, 1));
  
  globalWind = new PVector(0, 0);
}

void draw() {
  background(30, 20, 10);  // simple background
  
  // Update global wind
  globalWind.x = random(-0.05, 0.05);
  
  // Run leaf emitters
  for (LeafEmitter emitter : emitters) {
    emitter.applyForce(globalWind);
    emitter.applyForce(new PVector(0, 0.05));  // gravity
    emitter.run();
  }
}

void mousePressed() {
  // Add new emitter at mouse position (burst)
  emitters.add(new LeafEmitter(mouseX, mouseY, 1));
}
