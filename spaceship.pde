class Spaceship extends GameObject{
  
  // instance variables
 // PVector loc; 
 // PVector vel; 
  PVector dir; //direction
  final int MAXSPEED = 10;
  final float MINSPEED = 0.01;
  final int MINFRAMES = 25;
  int lastShot; 
  
  //constructor
  Spaceship() {
    super(width/2, height/2, 0 ,0);
    dir = new PVector(0.1, 0);
    lives = 3;
    lastShot = 0;
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
    //wall();
    checkForCollisions();
  }
  
  void rocketPart() {
    //println("locx=" + loc.x +",locy=" + loc.y + ",dirx=" + dir.x + ",diry=" + dir.y );
    PVector oppositeDir, o1, o2, o3, pos;
    oppositeDir = dir.copy();
    oppositeDir.mult(-1);
    pos = loc.copy();
    pos.add(oppositeDir);

    o1 = oppositeDir.copy();
    o2 = oppositeDir.copy();
    o3 = oppositeDir.copy();

    o1.setMag(random(3,12));
    o1.rotate(random(-PI/8,PI/8));
    objects.add(new Partical(pos.x, pos.y, o1.x, o1.y, RED, (int)random(3,7)) );
   
    o2.setMag(random(3,12));
    o2.rotate(random(-PI/8,PI/8));
    objects.add(new Partical(pos.x, pos.y, o2.x, o2.y, YELLOW, (int)random(3,7)) );

    o3.setMag(random(3,12));
    o3.rotate(random(-PI/8,PI/8));
    objects.add(new Partical(pos.x, pos.y, o3.x, o3.y, ORANGE, (int)random(3,7)) );
  }

  void move() {
    loc. add(vel);
     
    if (upkey){
      vel.add(dir);
      if (vel.x > MAXSPEED)  vel.x =  MAXSPEED; 
      if (vel.x < -MAXSPEED) vel.x = -MAXSPEED;
      if (vel.y > MAXSPEED)  vel.y =  MAXSPEED;
      if (vel.y < -MAXSPEED) vel.y = -MAXSPEED;
      rocketPart();
    } else {
      vel.mult(0.985); 
      if (abs(vel.x) < MINSPEED){  vel.x = 0;}; 
      if (abs(vel.y) < MINSPEED){  vel.y = 0;};
    }
    
    if (rightkey) dir.rotate(radians(5));
    if (leftkey) dir.rotate(-radians(5));
    //print(vel + "\n"); 
  }

  void shoot() {
    if (spacekey){
      if (frameCount >= lastShot + MINFRAMES){
        objects.add(new GoodBullet());
        lastShot = frameCount;
      }
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EvilBullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + 2*obj.d) && lives > 0) {
          lives = lives - 1;
          obj.lives = 0; 
        }
      }
      // else if (obj instanceof Asteroid) {
        //if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2) && lives > 0) {
          
          //lives = lives - 1; 
        //}
       i++;   
    }
      
  }
     
}
