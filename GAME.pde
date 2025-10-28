void game() {
  background(0);
  
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
  
  if ( (frameCount - gameStartFrame) % 2000 == 0){
    
  }
 
 
  textSize(53);
  fill(WHITE);
  text ("Lives "+GameObject.lives, 50, 100);
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
