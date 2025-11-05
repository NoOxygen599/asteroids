class Ufo extends GameObject {
    
  //instance variables
  final int MINFRAMES = 250;
  int lastShot; 
  
  Ufo() {
    super(0, random(height/4, height/2), 1, 0);
    if ( random(0,1) > 0.5 ){
       loc.x = width;
       vel.mult(-1);
    }
    vel.setMag(random(1, 3));
    lives = 1;
    lastShot = 0;
    d = 21;
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
    
    // change direction after #frames
    if ( frameCount % 200 == 0 ){
      vel.rotate( random(-PI/4, PI/4) );
    }
    loc.add(vel);
    
    // Kill if we go off the screen
    if (loc.x <= -10 || loc.x >= width + 10){
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
           explodes(200, 0, 4, 3, 15);
        }
      } 
      i++;
    }
  }
    
  void shoot() {
    if (frameCount >= lastShot + MINFRAMES){
      PVector v = new PVector(player1.loc.x - loc.x, player1.loc.y - loc.y);
      v.setMag(5);
      objects.add(new EvilBullet(loc.copy(), v));    
      lastShot = frameCount;
    }
  }
  
}
