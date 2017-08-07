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

/******** For Loop Example ********/

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

/******** Array Declaration ********/
int[] circlePos = {10, 20, 30, 40, 50};

void setup() {
  size(500, 500);
}

void draw() {
  for (int i = 0; i < width; i+=20) {
    line(i, 0, i, height);
  }
}
