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

void setup() {
  size(500, 500);
  gravity = new PVector(0, 0.1);

  ball_1 = new Ball(15, color(255), new PVector(4, 5));
}

void draw() {
  background(30);

  noStroke();
  ball_1.velocity.add(gravity);
  ball_1.update();
  ball_1.checkEdges();
  ball_1.display();
  //ellipse(position.x, position.y, size, size);
}
