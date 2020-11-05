float vx, vy;
void game() {
  if (!introM.isPlaying()) {
    introM.rewind();
    introM.play();
  }
  bg.resize(800, 800);
  image(bg, 0, 0);


  //time
  timer=timer-1;
  if (timer<0) {
    bally=bally+vy;
    ballx=ballx+vx;
  }

  //barriers
  if (p1x<70) {
    p1x=70;
  }

  if (p1x>730) {
    p1x=730;
  }


  //lives/scores
  fill(21, 244, 238);
  textSize(50);
  text("lives="+lives, 60, 700);
  text("score="+score, 60, 650);

  //paddle
  strokeWeight(0);
  fill(180, 0, 0);
  circle(p1x, p1y, p1d);

  //ball
  strokeWeight(0);
  fill(255);
  circle(ballx, bally, balld);

  //Losing Lives
  if (bally>800) {
    timer=100;
    bally=400;
    ballx=400;
    lives=lives-1;
    loselife.rewind();
    loselife.play();
  }
  if (lives==0) {
    mode=GAMEOVER;
  }


  //moving
  if (akey==true) p1x=p1x-5;
  if (dkey==true) p1x=p1x+5;

  if (bally<=0+balld/2) {
    vy = vy * -1;
  }

  //bouncing
  if (dist(p1x, p1y, ballx, bally)<=p1d/2+balld/2) {
    bounce.rewind();
    bounce.play();
    vy=(bally-p1y)/22;
    vx=(ballx-p1x)/22;
  }

  if (ballx<balld/2 || ballx>width-balld/2) {
    bounce.rewind();
    bounce.play();
    balld=balld*1;
    vx = vx * -1;
  }

  //Bricks
  int i=0;
  while (i<n) {
    if (alive[i] == true) {
      manageBrick(i);
    } 
    i++;
  }
}



void gameClicks () {
  if (dist(mouseX, mouseY, 0, 0)<800) {
    mode= PAUSE;
    textSize(200);
    text("PAUSE", 150, 450);
  }
}

void manageBrick(int i) {
  stroke(0);
  strokeWeight(8);
  if (y[i] == 75)  fill(orange);
  if (y[i] == 150) fill(purple);
  if (y[i] == 225) fill(mango);
  if (y[i] == 300) fill(green);
  circle(x[i], y[i], brickd);
  if (dist(x[i], y[i], ballx, bally)<=brickd/2+balld/2) {
    vx=(ballx-x[i]) /8;
    vy=(bally-y[i])/8;
    alive[i] = false;
    scoring.rewind();
    scoring.play();
    score=score+1;
    if (score == n) mode=GAMEOVER;
  }
}
