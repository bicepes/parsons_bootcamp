/******** Array Declaration ********/

/*
// Declare arrays
int[] numbers = {90, 150, 30};
String[] names = {"Andrew", "Neil", "Paolo", "ZiQiang", "Jeana"};

void setup() {

  // sort names and reverse-sort names
  names = sort(names);
  names = reverse(names);

  println(names);
}
*/

/******** For Loop Basic Example ********/

/*
int[] circlePos = {10, 20, 30, 40, 50};

void setup() {
  size(100, 100);
}

void draw() {
  for (int i = 0; i < 5; i++) {
    ellipse(circlePos[i],circlePos[i],10,10);
  }
}
*/

/******** For Loop Line Example ********/

/*

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  stroke(255);

  for (int i = 0; i < width; i+=20) {
    line(i, 0, i, height);
  }

  for (int i = 0; i < height; i+=20) {
    line(0, i, width, i);
  }
}

*/

/******** For Loop Line Example ********/

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  background(0);

  //stroke(255);
  noStroke();

  for (int i = 0; i < width; i+=20) {

    for (int j = 0; j < height; j+=20) {
      fill(i/2, j/2, 255);
      rect(i, j, 20, 20);
    }
  }

  // for (int i = 0; i < height; i+=20) {
  //   line(0, i, width, i);
  // }
}
