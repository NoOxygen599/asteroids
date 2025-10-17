class Bullet extends GameObject{
  
  int timer;
  
  Bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 120; 
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
    
   
      
    
    
}       
