class Asteroid extends GameObject {
  
  float rotInterval, rotCurrent, rotDirection;
  int rotSpeed;
  
  Asteroid(float x, float y, int l) {
    super(x, y, 1, 2);
    vel.setMag(random(1, 1.5));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*40;
    
    rotSpeed = (int)random(1, 10);
    rotInterval = PI/36;
    if (random(0,1) < 0.5){
      rotDirection = 1; 
    } else {
      rotDirection = -1;
    }
    rotCurrent = 0;
  }
  
  Asteroid() {
    super(random(width), random (height), 1, 2);
    vel.setMag(random(0.5, 1));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*40;

    rotSpeed = (int)random(1, 10);
    rotInterval = PI/180;
    if (random(0,1) < 0.5){
      rotDirection = 1; 
    } else {
      rotDirection = -1;
    }
    rotCurrent = 0;
  }
 
   
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    if ( mode != PAUSE && frameCount % rotSpeed == 0 ){
      rotCurrent = rotCurrent + (rotInterval * rotDirection);
    }
    rotate(rotCurrent);
    circle(0, 0, d);
    line(0, 0, d/2, 0);
    popMatrix();
  }
  
  void act() {
    loc.add(vel);
    wall();
    checkForCollisions();
  }
  
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof GoodBullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/1.5) && lives > 0) {
          objects.add(new Asteroid(loc.x-random(20,50), loc.y+random(20,50), (int)(lives-1)));
          objects.add(new Asteroid(loc.x+random(20,80), loc.y-random(20,50), (int)(lives-1)));
          //objects.add(new Asteroid());
          lives = 0;
          obj.lives = 0; 
        }
      } 
      i++;
    }
  }
  
}
