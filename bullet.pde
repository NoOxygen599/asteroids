class Bullet {
  
  PVector loc;
  PVector vel;
  //int lives;
  
  Bullet() {
    loc = new PVector(player1.loc.x, player1.loc.y);
    vel = player1.dir.copy();
    vel.setMag(10);
  }
    void show() {
      fill(BLACK);
      stroke(WHITE);
      strokeWeight(2);
      circle(loc.x, loc.y, 5);
    }
    
    void act() {
      loc.add(vel);
    }
    
    
    
    
}
