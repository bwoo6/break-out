void gameover() {
  //win
  if (score == n) {
    gameoverW.rewind();
    gameoverW.play();
    background(1);
    textSize(200);
    text("You WIN!", 80, 400);
    textSize(20);
    text("click anywhere to play again", 100, 600);
  }

  //lose
  if (lives == 0) {
    gameoverL.rewind();
    gameoverL.play();
    background(1);
    textSize(190);
    text("You LOSE!", 80, 400);
    textSize(20);
    text("click anywhere to play again", 100, 600);
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < 1000 && mouseY > 0 && mouseY < 1000) { 
    mode = INTRO;
    lives=3;
    score=0;
  }
}
