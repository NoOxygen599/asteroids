void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
  
  
  if (mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > 350 && mouseY < 450) {
    if (mode == INTRO){
      mode = GAME;
      gameStartFrame = frameCount;
    }
    else if (mode == GAMEOVER){
      mode = GAME;
      restartGame();
    }
  }
  
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (keyCode == 'z') zkey = true;
  if (keyCode == 'Z') zkey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (keyCode == 'z') zkey = false;
  if (keyCode == 'Z') zkey = false;
}
