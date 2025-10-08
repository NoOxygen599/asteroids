//ASTROIDS


//COLORS
color BLACK = #000000;
color WHILE = #FFFFFF;
color RED   = #DD0000;

//MODE FRAMEWORK
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
int mode = INTRO;

//keys
boolean upKey, downKey, leftKey, rightKey;

//PVector loc;
//PVector vel; 

void setup() {
  size (800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
