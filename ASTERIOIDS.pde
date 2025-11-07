import java.util.ArrayList; 

//animated gif
PImage[] gif;
int noF;
int f;

//COLORS
final color BLACK  = #000000;
final color WHITE  = #FFFFFF;
final color RED    = #DD0000;
final color GREY   = #8B8888;
final color YELLOW = #FFF40F;
final color ORANGE = #FF980F;
final color LBLUE  = #0ADAFC; 
final color[] colors = {BLACK, WHITE, GREY, LBLUE, RED, ORANGE};

//MODE FRAMEWORK
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
int mode = INTRO;

int gameStartFrame = 0;

//keys
boolean upkey, downkey, leftkey, rightkey, spacekey, zkey;

//Game Objects
Spaceship player1;

//List of Game Objects
ArrayList<GameObject> objects;


void setup() {
  size (800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  restartGame();
  
  //Create pause gif
  noF = 41;
  gif = new PImage[noF];
 
  int i = 0;
  while (i < noF) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i=i+1;
  }
  
}

void draw() {
  //print("fc:"+frameCount+"\n");
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  //else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  if (mode == PAUSE) {
    pause();
  }
}
