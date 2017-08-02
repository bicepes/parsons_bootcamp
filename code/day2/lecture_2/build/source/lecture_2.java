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

public class lecture_2 extends PApplet {

int xPosition;
int yPosition;
int xSpeed;
int ySpeed;

public void setup() {
  

  xPosition = width/2;
  yPosition = height/2 + 100;
  xSpeed = 5;
  ySpeed = 5;
}

public void draw() {
  background(255);
  fill(255,0,0);
  ellipse(xPosition,yPosition,100,100);

  // redundant, use || operator to combine two statements
  // if (xPosition < 0) {
  //   xSpeed *= -1;
  // }

  if (xPosition > width || xPosition <= 0) {
    xSpeed *= -1;
    // println("x position is: " + xPosition);
    // println("x speed is: " + xSpeed);
  }

  if (yPosition > height || yPosition <= 0) {
    ySpeed *= -1;
    // println("y position is: " + yPosition);
    // println("y speed is: " + ySpeed);
  }

  yPosition += ySpeed;
  xPosition += xSpeed;

}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
