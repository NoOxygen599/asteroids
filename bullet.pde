class Bullet extends GameObject{
  
  int timer;
  
  Bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 60; 
  }
    void show() {
      fill(BLACK);
      stroke(WHITE);
      strokeWeight(2);
      circle(loc.x, loc.y, 5);
    }
    
    void act() {
      loc.add(vel);
      wall();
      timer--;
      if (timer == 0) lives = 0;
    }
    
    void wall() {
      if (loc.x < -5) loc.x = width + 5; 
    if (loc.x > width +5) loc.x = -5; 
    if (loc.y < -5) loc.y = height + 5;
    if (loc.y > height +5) loc.y = -5; 
    }
    
    
}       
