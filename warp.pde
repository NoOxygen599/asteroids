class Warp {
  
  
  
   void warp() {
    
  }
  
 void show() {
    fill(WHITE);
  text ("Press 'Z' to Warp", 100, height - 50);
 }
 
 
 void act() {
   if (zkey) {
      player1.loc.x = random(50, width - 50);
      player1.loc.y = random(50, height - 50);
   }
 }
 

  
}
