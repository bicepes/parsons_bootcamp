PImage bill_gates, mark_zuckerberg,
  sponge_bob, george_washington, steve_jobs, mickey_mouse;
PFont font;

// bool variables for tracking stages of the game
boolean game_completed = false;
boolean stage_cover = true;
boolean stage_0 = false;

boolean stage_1 = false;
boolean stage_1a = false;
boolean stage_1b = false;

boolean stage_2 = false;
boolean stage_2a = false;
boolean stage_2b = false;

boolean stage_3 = false;


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
    textFont(font, (15));

    if (!stage_cover) {
      fill(224, 108, 117);
      textAlign(CORNER);
      text("Quit", 20, 40);
    }
}

void clearScreen() {
  background(255);
}

void mousePressed() {
  if (mousePressed && !stage_0) {
    stage_0 = true;
    stage_cover = false;

    clearScreen();
    printScreen("Is that a cartoon character?", 200, 25);
    printScreen("y/n", 250, 25);
  }
}

void keyPressed() {
  if (!stage_0 && !game_completed) {
    if (keyCode == ENTER && !stage_0) {
      stage_0 = true;
      stage_cover = false;

      clearScreen();
      printScreen("Is that a cartoon character?", 200, 25);
      printScreen("y/n", 250, 25);
    }
  }
  else if (stage_0 && !stage_1) {
    switch (keyCode) {
      case 89: {
        stage_1 = true;
        stage_1a = true;

        clearScreen();
        printScreen("Does that character live under water?", 200, 25);
        printScreen("y/n", 250, 25);
        break;
      }
      case 78: {
        stage_1 = true;
        stage_1b = true;

        clearScreen();
        printScreen("Is that person still alive?", 200, 25);
        printScreen("y/n", 250, 25);
        break;
      }
      default: break;
    }
  }
  else if (stage_1a && !stage_2) {
    switch (keyCode) {
      case 89: {
        game_completed = true;

        clearScreen();
        image(sponge_bob, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      case 78: {
        game_completed = true;

        clearScreen();
        image(mickey_mouse, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      default: break;
    }
  }
  else if (stage_1b && !stage_2) {
    switch (keyCode) {
      case 89: {
        stage_2 = true;
        stage_2a = true;

        clearScreen();
        printScreen("Is that person under the age of 50?", 200, 25);
        printScreen("y/n", 250, 25);
        break;
      }
      case 78: {
        stage_2 = true;
        stage_2b = true;

        clearScreen();
        printScreen("Does that person like Apple?", 200, 25);
        printScreen("y/n", 250, 25);
        break;
      }
      default: break;
    }
  }
  else if (stage_2a && !stage_3) {
    switch (keyCode) {
      case 89: {
        game_completed = true;

        clearScreen();
        image(mark_zuckerberg, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      case 78: {
        game_completed = true;

        clearScreen();
        image(bill_gates, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      default: break;
    }
  }
  else if (stage_2b && !stage_3) {
    switch (keyCode) {
      case 89: {
        game_completed = true;

        clearScreen();
        image(steve_jobs, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      case 78: {
        game_completed = true;

        clearScreen();
        image(george_washington, 340, 160, 120, 120);
        printScreen("It's me!", 360, 25);
        printScreen("Hit ENTER to restart!", 410, 25);
        break;
      }
      default: break;
    }
  }
  if (key == 'q' || key == 'Q') {
    clearStages();
  }
  else if (game_completed && keyCode == ENTER) {
    clearStages();
    game_completed = false;
  }
}

void clearStages() {
  stage_0 = stage_1 = stage_1a = stage_1b = stage_2 = stage_2a
  = stage_3 = false;
  stage_cover = true;
}
