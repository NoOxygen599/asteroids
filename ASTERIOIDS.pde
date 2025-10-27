import java.util.ArrayList; 

//gif
PImage[] gif;
int NoF;
int f;

//COLORS
final color BLACK = #000000;
final color WHITE = #FFFFFF;
final color RED   = #DD0000;
final color GREY  = #8B8888;

//MODE FRAMEWORK
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
int mode = GAMEOVER;

int gameStartFrame = 0;

//keys
boolean upkey, downkey, leftkey, rightkey, spacekey, zkey;

//Game Objects
Spaceship player1;
Ufo ufo1;

//List of Bullets
ArrayList<GameObject> objects;


void setup() {
  size (800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  objects = new ArrayList();
  player1 = new Spaceship();
  ufo1 = new Ufo();
  objects.add(player1);
  objects.add(ufo1);
  
  int i=0;
  while (i <= 6){
    objects.add(new Asteroid());
    i++;
  }
  
  //gif
  NoF = 41;
  gif = new PImage[NoF];
 
  i = 0;
  while (i < NoF) {
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
