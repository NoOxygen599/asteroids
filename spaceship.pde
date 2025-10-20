class Spaceship extends GameObject{
  
  // instance variables
 // PVector loc; 
 // PVector vel; 
  PVector dir; //direction
  final int MAXSPEED = 15;
  final float MINSPEED = 0.01;
  
  
  //constructor
  Spaceship() {
    super(width/2, height/2, 0 ,0);
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
    wall();
    checkForCollisions();
  }

  void move() {
    loc. add(vel);
     
    if (upkey){
      vel.add(dir);
      if (vel.x > MAXSPEED)  vel.x =  MAXSPEED; 
      if (vel.x < -MAXSPEED) vel.x = -MAXSPEED;
      if (vel.y > MAXSPEED)  vel.y =  MAXSPEED;
      if (vel.y < -MAXSPEED) vel.y = -MAXSPEED;
    } else {
      vel.mult(0.985); 
      if (abs(vel.x) < MINSPEED){  vel.x = 0; vel.y = 0;}; 
      if (abs(vel.y) < MINSPEED){  vel.y = 0; vel.x = 0;};
    }
    if (leftkey) dir.rotate(-radians(5));
    if (rightkey) dir.rotate(radians(5));
    print(vel + "\n"); 

  }
  void shoot() {
    if (spacekey) objects.add(new Bullet() );
  }
  void checkForCollisions() {
   
  }
  
}
