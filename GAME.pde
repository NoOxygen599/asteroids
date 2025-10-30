void game() {
  background(0);
  PFont font;
  
  int i = objects.size()-1;
  while ( i >= 0 ) {
    println("i:"+i+", size:"+objects.size());
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show(); 
    currentObject.wall();
    if (currentObject.lives == 0) objects.remove(i);
    i++;
  }
  if (mode == GAME && player1.lives == 0) {
    mode = GAMEOVER;
    player1.lives = 3;
    player1.loc.x = width/2;
    player1.loc.y = height/2; 
    
  }
  
  
  if ( (frameCount - gameStartFrame) % 2000 == 0){
    
  }
 
 
    textSize(15);
    fill(WHITE);
    font = loadFont ("OCRAExtended-43.vlw"); 
    textFont(font); 
    text ("Lives "+player1.lives, 100, 30);
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
