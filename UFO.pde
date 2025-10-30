class Ufo extends GameObject {
    
  //instance variables
  final int MINFRAMES = 30;
  int lastShot; 
  
  
  Ufo() {
    super(30, random (height-100), 1, 2);
    vel.setMag(random(1, 3));
    lives = 1;
    lastShot = 0;
  }
 
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(GREY);
    stroke(WHITE);
    strokeWeight(2);
    square(0, 0, 20);
    popMatrix();
  }
  
  void act() {
    loc.add(vel);
    if (loc.x >= width + 10){
       lives = 0; 
    }
    else {
      checkForCollisions();
      shoot();
    }
  }
 
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof GoodBullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2)){
          lives = 0;
          obj.lives = 0; 
        }
      } 
      i++;
    }
  }
    
  void shoot() {
 /*   if (spacekey) {
      if (frameCount >= lastShot + MINFRAMES){
        objects.add(new EvilBullet());
        lastShot = frameCount;
      }
    }
    */
    if (frameCount % 200 == 0){
      //objects.add(new EvilBullet());
    }
  }
  
}
