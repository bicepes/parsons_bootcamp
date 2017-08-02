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

public class homework_2 extends PApplet {

// Choose from 5 People/Characters
// {"Mark Zuckerberg", "Mickey Mouse", "Steve Jobs", ""
// Run this program to learn how each of these functions
// relate to the others.

public void draw() { } // Empty draw() needed to keep the program running

public void keyPressed() {
  println("pressed " + PApplet.parseInt(key) + " " + keyCode);
}

public void keyTyped() {
  println("typed " + PApplet.parseInt(key) + " " + keyCode);
}

public void keyReleased() {
  println("released " + PApplet.parseInt(key) + " " + keyCode);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "homework_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
