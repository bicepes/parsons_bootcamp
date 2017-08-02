int xPosition;
int yPosition;

void setup() {
  size(500,500);

  xPosition = width/2;
  yPosition = height/2;
}

void draw() {
  background(255);

  if (keyPressed) {
    fill(255, 60, 40);
  }
  else {
    fill(20, 60, 255);
  }
  ellipse(xPosition,yPosition,100,100);
}
