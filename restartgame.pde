void resetAsteroids(){
   // Create Asteroids
  int i=0;
  while (i <= 6){
    Asteroid a = new Asteroid();
    while ( dist( width/2, height/2, a.loc.x, a.loc.y ) < 200 ){
      a = new Asteroid();
    }
    objects.add(a);
    i++;
  } 
}

void restartGame() {
  score = 0;
  
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(player1);
  
  resetAsteroids();
}
