PImage[] gif;
int nof;

void intro() {
 //song 
  if (!introM.isPlaying()) {
    introM.rewind();
    introM.play();
  }
  
  //gif
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  //modulus of mod
  if (frameCount % 1 == 0) f=f+1;
  if (f==nof) f=0;



  //BACKGROUND
  fill(0, 0, 109);
  rectButton(300, 350, 200, 100);
  fill(255, 255, 0);
  textFont(zombie);
  textSize(50);
  text("START", 335, 420);
  stroke(21, 244, 238);

}


void show() {
}
void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
  }
}
