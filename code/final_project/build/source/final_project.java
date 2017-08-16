import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class final_project extends PApplet {

// import Minim sound library



// audio analysis variables
Minim minim;
AudioInput voice_in;
FFT fft;
float sound_volume;
float sound_frequency;
int sampling_rate= 44100;
// array that contains the half of the sampleRate size, because FFT only reads the half of the sampleRate frequency.
// this array will be filled with amplitude values.
float [] max= new float [sampling_rate/2];
float max_frequency;

// muFont custom fonts
PFont myFont;

// shape global variables
Shape sample_shape;
Shape sound_shape;
int sample_width;
int sample_height;
int sample_shape_code;
float scale;
int hue;

public void setup() {
  // canvas setup
  //fullScreen();
  
  colorMode(RGB);
  background(52, 46, 61);

  // configure frame frameRate
  frameRate(30);

  // load font
  myFont = createFont("data/RobotoMono-Light.ttf", 32);

  // display prompt
  drawPrompt();

  // setup shapes
  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  hue = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, hue, true);

  // setup sound input
  minim = new Minim(this);
  // get a line in from Minim, default bit depth is 16
  voice_in = minim.getLineIn(Minim.STEREO, 4096);
  // sample the sound input
  fft = new FFT(voice_in.mix.size(), sampling_rate);
}

public void draw() {
  colorMode(RGB);
  background(52, 46, 61);

  smooth();
  drawPrompt();
  sample_shape.display();
  sound_shape.display();
  detectSound();
  checkEqual();

  //println(voice_in.mix.level());
}

// testing
public void mousePressed() {
  reset();
}

// help function to draw button
public void drawPrompt() {
  // textSize(32);
  colorMode(RGB);
  fill(255);
  // text("Click to change shape", 10, 10, 70, 80);
  //fill(50);
  textFont(myFont);
  textSize(32);
  textAlign(CENTER);
  scale(1);
  text("Click to change shape", width/2, height - 150);
}

public void detectSound() {
  // analyze current volume
  sound_volume = voice_in.mix.level() * 100;
  float volume_controller = sound_volume;
  scale = map(sound_volume, 0, 100.0f, 0.1f, 2.0f);

  // analyze peak frequency
  fft.forward(voice_in.mix);
  for (int i=0; i < sampling_rate/2; i++) {
    float freq = fft.getFreq(PApplet.parseFloat(i));
    if (freq <= 1) {
      max[i] = 0;
    }
    else {
      max[i] = freq;
    }
  }

  //get maximum peak of volume
  max_frequency = max(max);

  // find the peak frequency
  for (int i=0 ; i < max.length; i++) {
    if (max[i] == max_frequency) {
     sound_frequency = i;
    }
  }

  // filter for noises
  if (volume_controller < 5) {
    sound_frequency = 0;
  }
  else {
    // println("max_frequency is " + sound_frequency + "\n");
  }

  // map frequency to hue
  hue = round(map(sound_frequency, 100, 600.0f, 0, 255));
  hue = constrain(hue, 0, 255);
  // println("hue is " + hue + "\n");
  sound_shape.update(scale, hue);
  //println(sound_frequency);
}

public void checkEqual() {
  if (abs(hue(sound_shape.hue) - hue(sample_shape.hue)) < 15) {
    println("hue match");

    if (abs(sound_shape.shape_width - sample_shape.shape_width*scale) < 20) {
      println("both match");
      // change the color of the sample to green
      sample_shape.update(2.0f, 105);
      sample_shape.update(1.0f, 105);
      delay(5000);

      reset();
    }
  }
  // if (abs(sound_shape.shape_width - sample_shape.shape_width*scale) < 1) {
  //   // println(abs(sound_shape.shape_width - sample_shape.shape_width*scale));
  //   println("volume match");
  //   // if (abs(hue(sound_shape.hue) - hue(sample_shape.hue)) < 5) {
  //   //   println("hue match");
  //   // }
  //   println(abs(hue(sound_shape.hue) - hue(sample_shape.hue)));
  //   if (abs(hue(sound_shape.hue) - hue(sample_shape.hue)) < 10) {
  //     println("both match");
  //   }
  //}
}

public void reset() {
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  hue = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, hue, true);
}
static final int SATURATION = 200;
static final int BRIGHTNESS = 200;

class Shape {
  PVector position;

  // determine the geometry of the shape [0, 3], triangle, rectangle, square or circle
  int shape;
  int shape_width;
  int shape_height;
  float shape_scale;

  int hue;
  boolean sound_shape;

  Shape(int random_shape, boolean is_sound_shape) {
    shape = random_shape;
    sound_shape = is_sound_shape;
    shape_scale = 1;

    // set width and height of the shape
    switch(shape) {
      case 0:
        shape_width = round(random(30, 400));
        shape_height = round((shape_width/2)/sqrt(3)*3);
        break;
      case 1:
        shape_width = round(random(30, 400));
        shape_height = round(random(50, 400));
        break;
      case 2:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
      case 3:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
      default:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
    }

    colorMode(HSB);
    hue = color(random(10, 250), SATURATION, BRIGHTNESS);

    // set shape position
    if (sound_shape) {
      position = new PVector(width/2 + 275, height/2);
    }
    else {
      position = new PVector(width/2 - 275, height/2);
    }
  }

  Shape(int random_shape, int s_width, int s_height, int c, boolean is_sound_shape) {
    shape = random_shape;
    sound_shape = is_sound_shape;

    shape_width = s_width;
    shape_height = s_height;
    shape_scale = 0.1f;

    colorMode(HSB);
    hue = c;

    // set shape position
    if (sound_shape) {
      position = new PVector(width/2 + 275, height/2);
    }
    else {
      position = new PVector(width/2 - 275, height/2);
    }
  }

  public void display() {
    fill(0, 0, 0, 0.7f);
    stroke(hue);
    strokeWeight(8);

    // set preferred geometry mode
    rectMode(CENTER);

    switch(shape) {
      case 0:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          triangle(
            0 - shape_width/2, 0 + shape_height/3,
            0, 0 - (shape_height*2)/3,
            0 + shape_width/2, 0 + shape_height/3
          );
          popMatrix();
        }
        else {
          triangle(
            position.x - shape_width/2, position.y + shape_height/3,
            position.x, position.y - (shape_height*2)/3,
            position.x + shape_width/2, position.y + shape_height/3
          );
        }
        break;
      case 1:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
      case 2:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
      case 3:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          ellipse(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          ellipse(position.x, position.y, shape_width, shape_height);
        }
        break;
      default:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
    }
  }

  public void update(float sound_level, int sound_hue) {
    shape_scale = sound_level;
    colorMode(HSB);
    hue = color(sound_hue, SATURATION, BRIGHTNESS);
  }
}

  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "final_project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
