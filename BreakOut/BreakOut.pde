import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer gameoverW, gameoverL, scoring, bounce, loselife,introM;

//Bricks Variable...
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;

int score, lives;

int mode,timer;

int f;

PImage bg;
//font
PFont zombie;

//colors
color darkblue = #272D4D;
color purple   = #B83564;
color mango    = #FF6A5A;
color orange   = #FFB350;
color green    = #83B8AA;
color white    = #FFFFFF;
color black    = #000000;

//mode
float p1x, p1y, p1d;
float ballx, bally, balld;

boolean akey, dkey;

final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;


void setup() {
  //bg
  bg=loadImage("bg.jpg");
  //sound
  minim = new Minim(this);
   gameoverW=minim.loadFile("clapping.wav");
   gameoverL=minim.loadFile("sad.mp3");
   scoring=minim.loadFile("score.wav");
   bounce=minim.loadFile("wall.wav");
   loselife=minim.loadFile("oof.mp3");
   introM=minim.loadFile("intro.wav");
  
  //Repeat
  nof=30;
  gif=new PImage[nof];

  int d=0;
  while (d<nof) {
    gif[d] = loadImage("frame_"+d+"_delay-0.03s.gif");
    d=d+1;
  }

  //brick
  lives=3;
  brickd=50;
  n=40;
  x= new int[n];
  y= new int[n];
  alive = new boolean[n];
  tempx=75;
  tempy=75;

  int i = 0;
  while (i<n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx=tempx+75;
    if (tempx>width) {
      tempy=tempy+75;
      tempx=75;
    }
    i=i+1;
  }


  //Others
  size(800, 800);
  mode = INTRO;
  zombie=createFont("zombie.ttf", 200);

  timer=100;
  ballx= width/2;
  bally=height/2;
  balld=30;

  vx=3;
  vy=3;

  p1x=width/2;
  p1y=height/1;
  p1d=150;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error:" +mode);
  }
}

void rectButton (int x, int y, int w, int h) {
  if (mouseX> x && mouseX < x+w && mouseY>y && mouseY<y+w) {
    strokeWeight(5);
    stroke(255, 0, 0);
  } else {
    stroke(1);
    strokeWeight(1);
  }
  rect(x, y, w, h);
}
