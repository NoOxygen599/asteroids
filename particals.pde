class Particle extends GameObject{
  
  color col; 
  int lifetime, startlifetime, alpha; 
  float size;
  
  Particle(float x, float y, float vx, float vy, color c, float s, int l) {
   super(x, y, vx, vy);
   col = c;
   lifetime = l;
   startlifetime = l;
   size = s;
   alpha = 255;
  }
  
 void show() {
   pushMatrix();
   translate(loc.x, loc.y);
   //alpha = alpha + (255/startlifetime);
   if ( lifetime <= startlifetime/4 ) alpha = (int)(alpha * 0.6);
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
