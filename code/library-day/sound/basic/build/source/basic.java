import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class basic extends PApplet {



Minim minim;
AudioPlayer player;

float vol;
float pan;

public void setup() {
  
  minim = new Minim(this);

  player = minim.loadFile("1.mp3");
  player.play();
  player.loop(2);
}


public void draw() {
  background(0);
  player.setGain(vol);
  player.setPan(pan);
}


public void keyPressed() {
  if (key == 'a') {
    player.rewind();
    player.play();
  } else if (key =='s') {
    if (player.isPlaying()) {
      player.pause();
    } else {
      player.play();
    }
  } else if (key == 'd') {
    vol -= 5;
  } else if (key == 'f') {
    vol += 5;
  } else if (key == 'g') {
    pan -= 0.1f;
  } else if (key == 'h') {
    pan += 0.1f;
  } else if (key == 'j') {
    player.skip(-500);
  } else if (key == 'k') {
    player.skip(+500);
  }
}
  public void settings() {  size(100, 100); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "basic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
