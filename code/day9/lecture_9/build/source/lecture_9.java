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

public class lecture_9 extends PApplet {

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

public void setup() {
  
  background(30);

  // colorMode can only be changed in the setup function
  colorMode(HSB);
  gravity = new PVector(0, 0.1f);

  balls = new ArrayList<Ball>();
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball());
  }
}

public void draw() {
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

public void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
}
class Ball {
  PVector position;
  PVector velocity;
  int radius;
  int hue;
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


  Ball(int size, int c, PVector speed) {
    radius = size;
    hue = c;
    velocity = speed;
    position = new PVector(width/2, height/2);
    age = 0;
  }

  public void update() {
    position.add(velocity);
    age++;
  }

  public void display() {
    fill(hue - color(0, 0, 0, age));
    ellipse(position.x, position.y, radius*2 - age/10, radius*2 - age/10);
  }

  public void checkEdges() {
    if (position.x > width - radius || position.x < 0 + radius) {
      velocity.x *= -1;
    }
    if (position.y > height - radius || position.y < 0 + radius) {
      velocity.y *= -1;
    }
  }

  public void run() {
    update();
    display();
    checkEdges();
  }

  public boolean isDead() {
    if (age > 360) {
      return true;
    }
    else {
      return false;
    }
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_9" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
