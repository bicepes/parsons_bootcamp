Dog ham;
Dog sparky;

void setup() {
  //color c = color(255, 0, 0);
  ham = new Dog("Bark!");
  sparky = new Dog("Hi");

  println(ham.legs);
  println(ham.ears);
  println(ham.fur);

  ham.bark();
  sparky.bark();

}

void draw() {

}
