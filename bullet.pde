class Bullet extends GameObject{
  
  int timer;
  boolean canHitAsteroid, wrapsScreen;
  color cFill, cStroke;
  int sWeight;
  
  Bullet(PVector l, PVector v, boolean cha, boolean ws) {
    super(l,v);
    
    canHitAsteroid = cha;
    wrapsScreen = ws;
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(cFill);
    stroke(cStroke);
    strokeWeight(sWeight);
    circle(0, 0, d);
    popMatrix();
  }
    
  void act() {
    loc.add(vel);
    wall(wrapsScreen);
    timer--;
    if (timer == 0) lives = 0;
  }
    
}       

class EvilBullet extends Bullet{
  
  EvilBullet(PVector l, PVector v){ 
    super(l, v, false, false);    
    cFill = RED;
    cStroke = RED;
    sWeight = 3;
    timer = 200;
    d = 10;
  }
  
  void act() {
    checkForCollisions();
    super.act();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof GoodBullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < (d/2 + obj.d/2)){
          lives = 0;
          obj.lives = 0; 
          player1.lives++; 
          explodes(30);
        }
      } 
      i++;
    } 
  }
  
}

class GoodBullet extends Bullet{
  
  GoodBullet(){
    super(player1.loc.copy(), player1.dir.copy(), true, true);
    cFill = LBLUE;
    cStroke = WHITE;
    sWeight = 2;
    vel.setMag(player1.vel.mag() + 8);
    timer = 120;
    d = 5;
  }

}
