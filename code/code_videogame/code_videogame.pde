PImage bill_gates, mark_zuckerberg,
  sponge_bob, george_washington, steve_jobs, mickey_mouse;
PFont font;

// bool variables for tracking stages of the game
boolean stage_0 = false;
boolean stage_1 = false;
boolean stage_2 = false;
boolean stage_3 = false;
boolean stage_4 = false;

void setup() {
  background(0);
  size(800, 600);

  // load images into Processing
  bill_gates = loadImage("bill_gates.png");
  mark_zuckerberg = loadImage("mark_zuckerberg.png");
  sponge_bob = loadImage("sponge_bob.png");
  george_washington = loadImage("george_washington.png");
  steve_jobs = loadImage("steve_jobs.png");
  mickey_mouse = loadImage("mickey_mouse.png");

  // load custom fonts into Processing
  font = createFont("ZillaSlabHighlight-Regular.ttf", 24);
}

void draw() {

  if (!stage_0) {
    background(255);
    image(bill_gates, 10, height/4, 120, 120);
    image(mark_zuckerberg, 140, height/4, 120, 120);
    image(sponge_bob, 270, height/4, 120, 120);
    image(george_washington, 400, height/4, 120, 120);
    image(steve_jobs, 530, height/4, 120, 120);
    image(mickey_mouse, 660, height/4, 120, 120);

    printScreen("Pick your favorite character/person", 400, 25);
    printScreen("Click to start the game!", 450, 25);
  }
}

void printScreen(String str, int y_position, int size) {

    //background(156, 169, 187);
    fill(0);
    textFont(font, (size));
    textAlign(CENTER);
    text(str, width/2, y_position);
}

void clearScreen() {
  background(255);
}

void mousePressed() {
  if (mousePressed) {
    stage_0 = true;

    clearScreen();
    printScreen("Is that a cartoon character?", 200, 25);
    printScreen("y/n", 250, 25);
  }
}

void keyPressed() {
  if (keyCode == ENTER && !stage_0) {
    stage_0 = true;

    clearScreen();
    printScreen("Is that a cartoon character?", 200, 25);
    printScreen("y/n", 250, 25);
  }
  
  // keyCode 89 == y || Y
  else if (keyCode == 89 && !stage_1){
    stage_1 = true;
  }
}
