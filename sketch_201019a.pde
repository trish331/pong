//Pong!
//Tricia Sun
//1-1
//Oct 15 2020


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer wall, score, rightpaddle, leftpaddle, intro, clapping;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddle
float ballx, bally, balld; //ball
float vx, vy; //ball velocity
boolean AI;

//scoring
int leftscore, rightscore, timer;



//keyboard variables
boolean wkey, skey, upkey, downkey;

// intro
 float clickedOnRect;

void setup () {
  size (800, 600);
  mode = INTRO;
  
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  vx = random (-5, 5);
  vy = random (-5, 5);
  
  //initialize score
  rightscore = leftscore = 0;
  timer = 100;
  
  //initialize keyboard variables
  wkey = skey = upkey = downkey = false;
  
  //minim
  minim = new Minim(this);
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
  intro = minim.loadFile("intro.wav");
  
  
  
}

void draw () {
  if (mode == INTRO) {
    intro ();
  }else if (mode == GAME) {
    game ();
  }else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Mode error: " + mode);
  }
}
  
