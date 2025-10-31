void game() {
  background(0);
  
  int i = 0;
  while ( i < objects.size() ) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show(); 
    currentObject.wall();
    if (currentObject.lives == 0) objects.remove(i);
    i++;
  } 
 // player1.lives = 3 ; 
  if (mode == GAME && player1.lives == 0) {
    mode = GAMEOVER;
    objects.add(player1);
    //if(mode == GAMEOVER && player1.lives == 0) {
    player1 = new Spaceship();
    player1.loc.x = width/2;
    player1.loc.y = height/2; 
  } else {
    player1.act();
    player1.show();
    player1.wall();
  }
  
  
  if ( (frameCount - gameStartFrame) % 2000 == 0){
    
  }
 
  // Show lives
  push();
  textFont( loadFont("OCRAExtended-43.vlw") ); 
  textSize(25);
  fill(YELLOW);
  text("Lives "+player1.lives, 70, 20);
  pop();
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
