class Asteroid extends GameObject {
  
  float rotSpeed, angle;
  
  Asteroid(float x, float y, int l) {
    super(x, y, 1, 2);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*40;
    rotSpeed = random(-2, 2);
    angle = 0; 
  }
  
    Asteroid() {
    super(random(width), random (height), 1, 2);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*40;
    rotSpeed = random(-2, 2);
    angle = 0; 
  }
 
  
  void show() {
    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
    line(loc.x, loc.y, loc.x+lives*40/2, loc.y);
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
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2) && lives > 0) {
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
