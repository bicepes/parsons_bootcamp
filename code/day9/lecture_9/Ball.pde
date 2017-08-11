class Ball {
  PVector position;
  PVector velocity;
  int radius;
  color hue;
  int age;

  Ball() {
    radius = 20;
    hue = color(random(255), 200, 255);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    position = new PVector(random(0 + radius, width - radius), height/2);
    age = 0;
  }

  Ball(int x, int y) {
    radius = 20;
    hue = color(random(255), 255, 255);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    position = new PVector(x, y);
    age = 0;
  }


  Ball(int size, color c, PVector speed) {
    radius = size;
    hue = c;
    velocity = speed;
    position = new PVector(width/2, height/2);
    age = 0;
  }

  void update() {
    position.add(velocity);
    age++;
  }

  void display() {
    fill(hue - color(0, 0, 0, age));
    ellipse(position.x, position.y, radius*2 - age/10, radius*2 - age/10);
  }

  void checkEdges() {
    if (position.x > width - radius || position.x < 0 + radius) {
      velocity.x *= -1;
    }
    if (position.y > height - radius || position.y < 0 + radius) {
      velocity.y *= -1;
    }
  }

  void run() {
    update();
    display();
    checkEdges();
  }

  boolean isDead() {
    if (age > 360) {
      return true;
    }
    else {
      return false;
    }
  }
}
