class Bullet extends GameObject{
  
  int timer;
  boolean canHitAsteroid, wrapsScreen;
  color cFill, cStroke;
  int sWeight;
  
  Bullet(PVector x, PVector y, boolean cha, boolean ws) {
    super(x,y);
    
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
    //print("ws:"+wrapsScreen+" lives:"+lives+"\n");
    wall(wrapsScreen);
    timer--;
    if (timer == 0) lives = 0;
  }
    
}       

class EvilBullet extends Bullet{
  
  EvilBullet(){ 
    super(ufo1.loc.copy(), player1.dir.copy(), false, false);    
    cFill = RED;
    cStroke = RED;
    sWeight = 3;
    println("player is:"+player1);
    vel = new PVector(player1.loc.x - ufo1.loc.x, player1.loc.y - ufo1.loc.y);
    vel.setMag(5);
    timer = 200;
    d = 10;
  }
  
}

class GoodBullet extends Bullet{
  
  GoodBullet(){
    super(player1.loc.copy(), player1.dir.copy(), true, true);
    cFill = BLACK;
    cStroke = WHITE;
    sWeight = 2;
    vel.setMag(player1.vel.mag() + 8);
    timer = 120;
    d = 5;
  }

}
