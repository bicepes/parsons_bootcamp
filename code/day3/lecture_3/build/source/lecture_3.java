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

public class lecture_3 extends PApplet {

int xPosition;
int yPosition;

public void setup() {
  

  xPosition = width/2;
  yPosition = height/2;
}

public void draw() {
  background(255);

  if (keyPressed) {
    fill(255, 60, 40);
  }
  else {
    fill(20, 60, 255);
  }
  ellipse(xPosition,yPosition,100,100);
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
