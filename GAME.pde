void game() {
  background(0);
  PFont font;
  
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
  if (mode == GAME && player1.lives == 0) {
    mode = GAMEOVER;
  }
  
  
  if ( (frameCount - gameStartFrame) % 2000 == 0){
    
  }
 
 
    textSize(10);
    fill(WHITE);
    font = loadFont ("OCRAExtended-43.vlw"); 
    textFont(font); 
    text ("Lives "+player1.lives, 120, 30);
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
