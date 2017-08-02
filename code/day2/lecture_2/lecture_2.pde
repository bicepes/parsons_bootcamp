int xPosition;
int yPosition;
int xSpeed;
int ySpeed;

void setup() {
  size(500,500);

  xPosition = width/2;
  yPosition = height/2 + 100;
  xSpeed = 5;
  ySpeed = 5;
}

void draw() {
  background(255);
  fill(255,0,0);
  ellipse(xPosition,yPosition,100,100);

  // redundant, use || operator to combine two statements
  // if (xPosition < 0) {
  //   xSpeed *= -1;
  // }

  if (xPosition > width || xPosition <= 0) {
    xSpeed *= -1;
    // println("x position is: " + xPosition);
    // println("x speed is: " + xSpeed);
  }

  if (yPosition > height || yPosition <= 0) {
    ySpeed *= -1;
    // println("y position is: " + yPosition);
    // println("y speed is: " + ySpeed);
  }

  yPosition += ySpeed;
  xPosition += xSpeed;

}
