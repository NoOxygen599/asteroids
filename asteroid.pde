class Asteroid extends GameObject {

  float rotInterval, rotCurrent, rotDirection;
  int rotSpeed;

  Asteroid(float x, float y, int l) {
    super(x, y, 1, 2);
    vel.setMag(random(0.5, 1));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*40;

    rotSpeed = (int)random(1, 10);
    rotInterval = PI/36;
    if (random(0, 1) < 0.5) {
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
    if (random(0, 1) < 0.5) {
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
    if ( mode != PAUSE && frameCount % rotSpeed == 0 ) {
      rotCurrent = rotCurrent + (rotInterval * rotDirection);
    }
    rotate(rotCurrent);
    line(-40, 15, -40, -15);
    line(40, -15, 40, 15);
    line(-40, 15, -15, 40); 
    line(40, -15, 15, -40); 
    line(-15, 40, 15, 40);
    line(15, -40, -15, -40);
    line(15, 40, 40, 15); 
    line(-15, -40, -40, -15); 
    fill(BLACK, 0); 
    circle(0, 0, d);
   // line(0, 0, d/2, 0);
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
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2) && lives >= 1) {
          objects.add(new Asteroid(loc.x+random(-d/2, d/2), loc.y+random(-d/2, d/2), (int)(lives-1)));
          objects.add(new Asteroid(loc.x+random(-d/2, d/2), loc.y+random(-d/2, d/2), (int)(lives-1)));
          lives = 0;
          obj.explodes(50, 0 ,3, 5, 18);
          // *** Draw Asteroid Particles here
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
