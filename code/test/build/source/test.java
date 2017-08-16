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

public class test extends PApplet {
  public void setup() {


// Before we deal with pixels
loadPixels();

// Loop through every pixel
for (int i = 0; i < pixels.length; i++ ) { // We can get the length of the pixels array just like with any array.

  // Pick a random number, 0 to 255
  float rand = random(255);

  // Create a grayscale color based on random number
  int c = color(155);

  // Set pixel at that location to random color
  pixels[i] = c; // We can access individual elements of the pixels array via an index, just like with any other array.
}

// When we are finished dealing with pixels
updatePixels();
    noLoop();
  }

  public void settings() { size(200, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
