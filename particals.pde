class Partical extends GameObject{
  
  color col; 
  int lifetime, startlifetime, alpha; 
  float size;
  
  Partical(float x, float y, float vx, float vy, color c, int l) {
   super(x, y, vx, vy);
   col = c;
   lifetime = l;
   startlifetime = l;
   size = (random(1,3));
   alpha = 255;
  }
  
 void show() {
   pushMatrix();
   translate(loc.x, loc.y);
   if ( lifetime <= startlifetime/4 ) alpha = (int)(alpha * 0.75);
   fill(col, alpha);
   stroke(col, alpha);
   strokeWeight(0);
   square(0, 0, size);
   popMatrix();
  }
 
 void act() {
    loc.add(vel);
    lifetime--;
    if (lifetime == 0) lives = 0;
  }
 
 void move(){
   vel.setMag(-player1.vel.mag());
  }
  
  
}
