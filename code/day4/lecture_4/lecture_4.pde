int ySpeed = 2;
int y;

void setup() {
  size(500, 500);
  y = height/2;
}

void draw() {
  // three circles
  fill(40, 40, 40, 20);
  rect(0, 0, width, height);
  drawCircles(width/2, y);

  if (y > height || y < 0) {
    ySpeed *= -1;
  }
  y += ySpeed;
}

void drawCircles(int xPosition, int yPosition) {
  noStroke();
  fill(yPosition/2, 80 ,164);

  int size = (int)map(mouseX, 0, 250, 10, 150);

  ellipse(xPosition, yPosition, size, size);
  ellipse(xPosition-100,yPosition, size, size);
  ellipse(xPosition+100, yPosition, size, size);
}
