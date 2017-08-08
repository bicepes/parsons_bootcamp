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

public class lecture_7 extends PApplet {

PVector position;
PVector speed;
PVector gravity;
float friction;
int size;

public void setup() {
  size = 30;
  
  position = new PVector(width/2, height/2);
  speed = new PVector(2, 1);
  gravity = new PVector(0, 0.1f);
  friction = 0.99f;
}

public void draw() {
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
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_7" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
