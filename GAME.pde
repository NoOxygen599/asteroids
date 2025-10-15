void game() {
  background(0);
  player1.act(); 
  player1.checkForCollisions();
  
  int i = 0;
  while ( i < bullets.size()) {
    Bullet currentBullet = bullets.get(i);
    currentBullet.act();
    currentBullet.show(); 
    i++;
  }
  player1.show();
}

void gameClicks() {
  
}
