class Ufo extends GameObject {
  
    Ufo() {
      super(30, random (height), 1, 2);
      vel.setMag(random(1, 3));
      lives = 1;
    }
 
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    square(0, 0, 20);
    popMatrix();
  }
  
  void act() {
    checkForCollisions();
    shoot();
  }
  
  void shoot() {
    
  }
  
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
          lives = 0;
          obj.lives = 0; 
      } 
      i++;
    }
  }
  
}
