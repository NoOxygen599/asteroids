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
  
  void explodes(int ps){
    int i = 0;
    while (i < ps){
      objects.add(new Particle(loc.x, loc.y, random(-3,3), random(-3,3), colors[(int)random(0,colors.length)], random(5,15), (int)random(5,50)));
      i++;
    }
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
      if (loc.x < -20) loc.x = width + 20; 
      if (loc.x > width +20) loc.x = -20; 
      if (loc.y < -20) loc.y = height + 20;
      if (loc.y > height +20) loc.y = -20;    
  }
  
}
