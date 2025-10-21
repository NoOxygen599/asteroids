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
    if (currentObject.lives == 0) 
      objects.remove(i);
    else
      i++;
  }
  //player1.show();
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
