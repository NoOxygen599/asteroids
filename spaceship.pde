class Spaceship extends GameObject{
  
  // instance variables
  // PVector loc; 
  // PVector vel; 
  PVector dir; //direction
  final int MAXSPEED = 7;
  final float MINSPEED = 0.01;
  final int MINFRAMES = 15;
  final int WARPTP = 150;
  final int DEFAULTLIVES = 3;
  final int INVINCIBLE_DURATION = 150;
  int lastShot, warpTimer, invincibleTimer; 
  
  //constructor
  Spaceship(float x, float y) {
    super(x, y, 0, 0);
    dir = new PVector(0, -0.1);
    lives = DEFAULTLIVES;
    lastShot = 0;
    warpTimer = 0;
    d = 20;
    invincibleTimer = 0;
  }
  
  Spaceship() {
    super(width/2, height/2, 0 ,0);
    dir = new PVector(0.1, 0);
    lives = DEFAULTLIVES;
    lastShot = 0;
    warpTimer = 0;
    d = 20;
    invincibleTimer = 0;
  }
  
  //behaviour functions
  void show () {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    if ( invincibleTimer > 0 ){
      drawShield(); 
    }
    drawShip();
    popMatrix();
  }
  
  void drawShip() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(4); 
    triangle(25, 0, -10, -10, -10, 10);
  }
  
  void drawShield() {
    pushMatrix();
    strokeWeight(4);
    stroke(LBLUE, invincibleTimer*2);
    fill(BLACK, 0);
    circle(4, 0, d+40);
    popMatrix();
  }
  
  void act () {
    move();
    shoot();
    warp();
    checkForCollisions();
  }
  
  void rocketPart() {
    //println("locx=" + loc.x +",locy=" + loc.y + ",dirx=" + dir.x + ",diry=" + dir.y );
    PVector oppositeDir, pos;
    color[] c = {RED, YELLOW, ORANGE};
    
    oppositeDir = dir.copy();
    oppositeDir.mult(-1);
    oppositeDir.setMag(random(7,20));
    pos = loc.copy();
    pos.add(oppositeDir);
    
    int i = 0;
    while ( i < (int)random(1,40) ){
      oppositeDir.rotate(random(-PI/20,PI/20));
      objects.add(new Particle(pos.x+random(-7,7), pos.y+random(-7,7), oppositeDir.x, oppositeDir.y, c[(int)random(0,2)], random(1,3), (int)random(1,5)) );
      i++;
    }
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
    
    if (rightkey) dir.rotate(radians(7));
    if (leftkey) dir.rotate(-radians(7));
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


  void warp() {
  
    if (zkey) {
      if (warpTimer <= 0){
        loc.x = random(50, width - 50);
        loc.y = random(50, height - 50);
        int i = 0;
        while ( i < objects.size() ) {
          GameObject currentObject = objects.get(i);
          if (dist(loc.x, loc.y, currentObject.loc.x, currentObject.loc.y) < (d/2 + currentObject.d/2 + 50)){
            loc.x = random(50, width - 50);
            loc.y = random(50, height - 50);
            i = 0;
          }
          i++;
        } 
        warpTimer = WARPTP;
      }
    }
  
    warpTimer--;
  }

  void checkForCollisions() {
    int i = 0;
    
    if ( invincibleTimer == 0) {
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof EvilBullet) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2) && lives > 0) {
            lives = lives - 1;
            invincibleTimer = INVINCIBLE_DURATION;
            obj.lives = 0; 
          }
        } else if (obj instanceof Asteroid) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 +  obj.d/2) && lives > 0) {
            lives = lives - 1; 
            invincibleTimer = INVINCIBLE_DURATION;
          }
         }
         i++;   
      }
    } else {
      invincibleTimer--;
    }
      
  }
     
}
