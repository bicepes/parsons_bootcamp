import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class lecture_8 extends PApplet {

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

public void setup() {
  
  gravity = new PVector(0, 0.1f);

  ball_1 = new Ball(15, color(255), new PVector(4, 5));
}

public void draw() {
  background(30);


  smooth(128);
  noStroke();
  ball_1.velocity.add(gravity);
  ball_1.update();
  ball_1.checkEdges();
  ball_1.display();
  //ellipse(position.x, position.y, size, size);
}
class Ball {
  PVector position;
  PVector velocity;
  int radius;
  int hue;

  Ball(int size, int c, PVector speed) {
    radius = size;
    hue = c;
    velocity = speed;
    position = new PVector(width/2, height/2);
  }

  public void update() {
    position.add(velocity);
  }

  public void display() {
    fill(hue);
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  public void checkEdges() {
    if (position.x > width - radius || position.x < 0 + radius) {
      velocity.x *= -1;
    }
    if (position.y > height - radius || position.y < 0 + radius) {
      velocity.y *= -1;
    }
  }
}
// Create a class called Dog
class Dog {
  // properties
  int legs;
  int ears;
  int eyes;
  int nose;
  String saying;
  // processing color doc
  //https://processing.org/reference/color_datatype.html
  int fur;

  PVector position;

  Dog(int c) {
    legs = 4;
    ears = 2;
    fur = c;
  }

  Dog(String say) {
    legs = 4;
    ears = 2;
    saying = say;
  }

  public void bark() {
    println(saying);
  }

  public void walk() {
    //
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_8" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
