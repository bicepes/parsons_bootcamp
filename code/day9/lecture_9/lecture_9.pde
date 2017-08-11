// Dog ham;
// Dog sparky;
//
// void setup() {
//   //color c = color(255, 0, 0);
//   ham = new Dog("Bark!");
//   sparky = new Dog("Hi");
//
//   println(ham.legs);
//   println(ham.ears);
//   println(ham.fur);
//
//   ham.bark();
//   sparky.bark();
//
// }
//
// void draw() {
//
// }

// Re-write the ball movement using class
PVector gravity;
Ball ball_1;
Ball ball_2;
Ball ball_3;
ArrayList<Ball> balls;

void setup() {
  size(500, 500);
  background(30);

  // colorMode can only be changed in the setup function
  colorMode(HSB);
  gravity = new PVector(0, 0.1);

  balls = new ArrayList<Ball>();
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(30);

  // draw ball 1
  noStroke();

  for (int i = 0; i < balls.size(); i++) {
    balls.get(i).velocity.add(gravity);
    balls.get(i).run();
    if (balls.get(i).isDead()) {
      balls.remove(i);
    }
  }

}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
}
