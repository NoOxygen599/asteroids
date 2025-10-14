class Spaceship{
  
  // instance variables
  PVector loc; 
  PVector vel; 
  PVector dir; //direction
  
  
  //constructor
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(1, 0);
  }
  
  //behaviour functions
  void show () {
    pushMatrix();
    translate(loc.x, loc.y);
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
    
  }
  void shoot() {
    
  }
  void checkForCollisions() {
    
  }
  
}
