PVector position;
PVector speed;
PVector gravity;
float friction;
int size;

void setup() {
  size = 30;
  size(500, 500);
  position = new PVector(width/2, height/2);
  speed = new PVector(2, 1);
  gravity = new PVector(0, 0.1);
  friction = 0.99;
}

void draw() {
  background(30);

  speed.add(gravity);
  speed.mult(friction);
  position.add(speed);

  if (position.x > width - size/2 || position.x < 0 + size/2) {
    speed.x *= -1;
  }
  if (position.y > height - size/2 || position.y < 0 + size/2) {
    speed.y *= -1;
  }
  ellipse(position.x, position.y, size, size);

  // position.sub(speed);

}
