class GameObject {
  
  PVector loc; //location
  PVector vel; //velocity
  int lives;
  
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
  }
  
  GameObject(PVector l, PVector v) {
     loc = l;
     vel = v;
  }
  
  void act() {
    
  }
  
  
  void show() {
    
  }
  
  void wall() {
  
  }
  
}
