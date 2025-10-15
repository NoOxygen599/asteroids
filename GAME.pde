void game() {
  background(0);
 // player1.act(); 
  //player1.checkForCollisions();
  
  int i = 0;
  while ( i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show(); 
    currentObject.wall();
    i++;
  }
  //player1.show();
}

void gameClicks() {
  
}
