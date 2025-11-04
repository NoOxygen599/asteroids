class GameObject {
  
  PVector loc; //location
  PVector vel; //velocity
  int lives;
  float d;
  
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 1;
  }
  
  GameObject(PVector l, PVector v) {
     loc = l;
     vel = v;
     lives = 1;
  }
  
  GameObject(PVector l, PVector v, int lv) {
     loc = l;
     vel = v;
     lives = lv;
  }
  
  void act() {
    
  }
  
  
  void show() {
    
  }
  
  
  void wall(boolean ws) {
    if ( ws ){
      wall();
    } else {
      if (loc.x < -20 || loc.x > width +20 || loc.y < -20 || loc.y > height +20){
        lives = 0;
      }
    }
  }
  
  void wall(){
      if (loc.x < -d) loc.x = width + d; 
      if (loc.x > width + d) loc.x = -d; 
      if (loc.y < -d) loc.y = height + d;
      if (loc.y > height + d) loc.y = -d;    
  }
  
}
