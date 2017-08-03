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

public class lecture_4 extends PApplet {

int ySpeed = 2;
int y;

public void setup() {
  
  y = height/2;
}

public void draw() {
  // three circles
  fill(40, 40, 40, 20);
  rect(0, 0, width, height);
  drawCircles(width/2, y);

  if (y > height || y < 0) {
    ySpeed *= -1;
  }

  y += ySpeed;
}

public void drawCircles(int xPosition, int yPosition) {
  noStroke();
  fill(yPosition/2, 80 ,164);

  int size = (int)map(mouseX, 0, 250, 10, 150);

  ellipse(xPosition, yPosition, size, size);
  ellipse(xPosition-100,yPosition, size, size);
  ellipse(xPosition+100, yPosition, size, size);
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lecture_4" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
