//ASTROIDS


//COLORS
color BLACK = #000000;
color WHITE = #FFFFFF;
color RED   = #DD0000;

//MODE FRAMEWORK
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
int mode = INTRO;

//keys
boolean upkey, downkey, leftkey, rightkey;


//Game Objects
Spaceship player1;


//pvectors
PVector loc;
PVector vel; 
PVector gravity;

float d;

void setup() {
  size (800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  player1 = new Spaceship();
  
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-1,1), random(-1,1));
  gravity = new PVector(0, 1);
  d = 100;
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
