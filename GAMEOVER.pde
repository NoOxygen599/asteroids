void gameOver() {
  if (score > highscore){
    highscore = score;
  }
  
  background(RED);
  textSize(100);
  text("GAMEOVER", width/2, 150);
  
  textSize(30);
  fill(WHITE);
  text("SCORE: "+score, width/2, 275);
  text("HIGH SCORE: "+highscore, width/2, 310);
  
  textSize(50);
  fill(BLACK);
  rect(width/2, 400, 270, 80);
  
  fill(WHITE);
  text("RESTART", width/2, 400);
}

void gameOverClicks() {
  
}
