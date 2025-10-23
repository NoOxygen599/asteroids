class GameObject {
  
  public PVector loc; //location
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
  
  void wall() {
  if (loc.x < -20) loc.x = width + 20; 
    if (loc.x > width +20) loc.x = -20; 
    if (loc.y < -20) loc.y = height + 20;
    if (loc.y > height +20) loc.y = -20; 
    
  }
  
}
