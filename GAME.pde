void game() {
  background(0);
  player1.show();
  player1.act(); 
  player1.checkForCollisions();
  
  int i = 0;
  while ( i < bullets.size()) {
    Bullet currentBullet = bullet.get(i);
    
    i++;
  }
  
}

void gameClicks() {
  
}
