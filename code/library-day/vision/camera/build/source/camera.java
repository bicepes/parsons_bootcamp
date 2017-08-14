import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class camera extends PApplet {

//Brightness Tracking

Capture video;

public void setup(){
  
  video = new Capture(this, width, height);
  video.start();
  noStroke();
  
}

public void draw(){
  if(video.available()){
    video.read();
    image(video, 0, 0, width, height);//DRAW CAM ON SCREEN

    int brightestX = 0; //X Coord. of brightest vid pixel
    int brightestY = 0; //Y Coord. of brightest vid pixel
    float brightestValue = 0; //Brightest of the brightest vid pixel

    video.loadPixels();
    int index = 0;
    for (int y = 0; y<video.height; y++){
      for(int x = 0; x <video.width; x++){

        int pixelValue = video.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        if(pixelBrightness>brightestValue){
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        }
        index++;
      }
    }

    fill(255, 100, 0, 128);
    ellipse(brightestX, brightestY, 200, 200);
  }
}
  public void settings() {  size(640, 480);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "camera" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
