int x = 50;
int y = 250;
int w = 50;
int h = 50;

int r = 0;
int g = 0;
int b = 255;


// make a sketch first
void setup() {
  // the canvas to be 500 x 500
  size(500, 500);
  println(x);
}

// draw shapes
// draw loop runs infinitely 60 frame/s
void draw() {

  // a circle and a rectangle and filled with colors
  fill(255, 0, 0);
  stroke(0, 0, 0);
  // x, y, width, height
  ellipse(width/2,height/2,w,h);

  fill(0, 255, 255);
  rect(50, 50, 100, 25);
}
