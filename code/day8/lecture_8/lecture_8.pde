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

void setup() {
  size(500, 500);
  background(30);
  gravity = new PVector(0, 0.1);

  ball_1 = new Ball(15, color(255), new PVector(4, 5));
  ball_2 = new Ball(25, color(255, 0, 255), new PVector(-4, -5));
  ball_3 = new Ball(10, color(0, 255, 0), new PVector(3, 0));
}

void draw() {
  background(30);

  // draw ball 1
  noStroke();
  ball_1.velocity.add(gravity);
  ball_1.run();

  // draw ball 2
  ball_2.velocity.add(gravity);
  ball_2.run();

  ball_3.velocity.add(gravity);
  ball_3.run();

}
