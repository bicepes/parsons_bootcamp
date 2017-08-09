class Ball {
  PVector position;
  PVector velocity;
  int radius;
  color hue;

  Ball(int size, color c, PVector speed) {
    radius = size;
    hue = c;
    velocity = speed;
    position = new PVector(width/2, height/2);
  }

  void update() {
    position.add(velocity);
  }

  void display() {
    fill(hue);
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  void checkEdges() {
    if (position.x > width - radius || position.x < 0 + radius) {
      velocity.x *= -1;
    }
    if (position.y > height - radius || position.y < 0 + radius) {
      velocity.y *= -1;
    }
  }
}
