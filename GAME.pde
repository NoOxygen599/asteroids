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
 
  if (mode == GAME && player1.lives == 0) {
    mode = GAMEOVER;
  }
    
  // Create the UFO every 2000 frames
  if ( (frameCount - gameStartFrame) % 1000 == 0){
    objects.add( new Ufo() );
  }
 
  // Show lives
  push();
  fill(WHITE);
  
  textFont( loadFont("OCRAExtended-43.vlw") ); 
  textSize(25);
  text("Lives "+player1.lives, 80, 20);
  pop();
  
  push();
  textFont( loadFont("OCRAExtended-43.vlw") ); 
  fill(WHITE);
   textSize(20); 
  text ("Press 'Z' to Warp", 120, height - 30);;
  pop();
}

void gameClicks() {
  if(mouseX < width && mouseY < height) {
    mode = PAUSE;
  }
  
}
