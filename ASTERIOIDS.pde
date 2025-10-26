import java.util.ArrayList; 



//gif
PImage[] gif;
int NoF;
int f;


//COLORS
color BLACK = #000000;
color WHITE = #FFFFFF;
color RED   = #DD0000;


//MODE FRAMEWORK
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;
int mode = GAMEOVER;

//keys
boolean upkey, downkey, leftkey, rightkey, spacekey, zkey;


//Game Objects
Spaceship player1;

//List of Bullets
ArrayList<GameObject> objects;



//pvectors
PVector loc;
PVector vel; 
PVector gravity;

float d;

void setup() {
  size (800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(player1);
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  
  //gif
   NoF = 41;
  gif = new PImage[NoF];
 
  int i = 0;
  while (i < NoF) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i=i+1;
  }
  
  
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-1,1), random(-1,1));
  gravity = new PVector(0, 1);
  d = 100;
}

void draw() {
  print("fc:"+frameCount+"\n");
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  //else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
  if (mode == PAUSE) {
    pause();
  }
}
