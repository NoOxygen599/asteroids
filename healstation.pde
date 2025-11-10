class Healstation extends GameObject {
    
  //instance variables
    
  Healstation() {
    super(random(width*0.25,  width*0.75), 0, 0, 1);
    if ( random(0,1) > 0.5 ){
       loc.y = height;
       vel.mult(-1);
    }
    vel.setMag(random(1, 3));
    lives = 1;
    d = hsimage.width * 0.659;
  }
 
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    scale(0.7);   
    image(hsimage, -hsimage.width/2, -hsimage.height/2);
    popMatrix();
  }
  
  void act() {
    
    // change direction after #frames
    if ( frameCount % 75 == 0 ){
      vel.rotate( random(-PI/5, PI/5) );
    }
    loc.add(vel);
    
    // Kill if we go off the screen
    if (loc.y <= -15 || loc.y>= height + 15){
       lives = 0; 
    }
    else {
      checkForCollisions();
    }
  }
 
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Spaceship) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2)){
          lives = 0;
          obj.lives++; 
          explodes(100, 6, 9, 3, 5);
          score = score + 250;
        }
      } 
      i++;
    }
  }
    
 
}
