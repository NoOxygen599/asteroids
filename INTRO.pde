void intro() {
  background(BLACK);
  
  //title
  fill(WHITE);
  textSize(100);
  text("A$T3R0!D$", width/2, height/2-100);
  
  //start
  drawSquareButton (WHITE, BLACK, RED, width/4, height/2+100, 150, 75);
  
  //Options
}

void introClicks() {
  if (buttonTouchesMouse(width/4, height/2+100, 150, 75)) {
    mode = GAME;
  }
}
 
