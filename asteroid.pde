class Asteroid extends GameObject {
  
  
  Asteroid() {
    super(random(width), random (height), 1, 2);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
  }
  
  
  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    circle(loc.x, loc.y, lives*40);
    line(loc.x, loc.y, loc.x+lives*40/2, loc.y);
  }
  
  void act() {
    loc.add(vel);
    wall();
  }
  
  
  
}
