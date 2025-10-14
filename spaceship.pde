class Spaceship{
  
  // instance variables
  PVector loc; 
  PVector vel; 
  PVector dir; //direction
  
  
  //constructor
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(0.1, 0);
  }
  
  //behaviour functions
  void show () {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();

    popMatrix();
  }
  
  void drawShip() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(4); 
    triangle(25, 0, -10, -10, -10, 10);
  }
  
  void act () {
    move();
    shoot();
    checkForCollisions();
  }

  void move() {
    loc. add(vel);
    if (upkey) vel.add(dir);
    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
    
  }
  void shoot() {
    
  }
  void checkForCollisions() {
    if (loc.x < -20) loc.x = width + 20; 
    if (loc.x > width +20) loc.x = -20; 
    if (loc.y < -20) loc.y = height + 20;
    if (loc.y > height +20) loc.y = -20; 
  }
  
}
