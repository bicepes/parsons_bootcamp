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

public class code_videogame extends PApplet {

PImage bill_gates, mark_zuckerberg,
  sponge_bob, george_washington, steve_jobs, mickey_mouse;
PFont font;
int time = millis();

public void setup() {
  background(0);
  

  // load images into Processing
  bill_gates = loadImage("bill_gates.png");
  mark_zuckerberg = loadImage("mark_zuckerberg.png");
  sponge_bob = loadImage("sponge_bob.png");
  george_washington = loadImage("george_washington.png");
  steve_jobs = loadImage("steve_jobs.png");
  mickey_mouse = loadImage("mickey_mouse.png");

  // load custom fonts into Processing
  font = createFont("RobotoMono-Regular", 24);
}

public void draw() {
  //fill(255, 30, 64);
  background(156, 169, 187);
  image(bill_gates, 10, height/4, 120, 120);
  image(mark_zuckerberg, 140, height/4, 120, 120);
  image(sponge_bob, 270, height/4, 120, 120);
  image(george_washington, 400, height/4, 120, 120);
  image(steve_jobs, 530, height/4, 120, 120);
  image(mickey_mouse, 660, height/4, 120, 120);

  fill(0);
  textFont(font, (40));
  text("PICK A CHARACTER/PERSON", 120, 350);
  text("CLICK TO START", 200, 450);

  if (mousePressed) {

    fill(0);
    textFont(font, (35));
    textAlign(CENTER);
    text("PICK A CHARACTER/PERSON", 800, 350);
    textAlign(CENTER);
    text("CLICK TO START", 800, 450);
  }
}

public void clearScreen(String str) {
    background(156, 169, 187);

    fill(0);
    textFont(font, (35));
    textAlign(CENTER);
    text(str, 800, 350);
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "code_videogame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
