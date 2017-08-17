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



// global variables
int [] colors;
int colors_index;
boolean is_success = false;
int alpha = 1;
int delta = 10;

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

// muFont custom fonts & images
PFont myFont;
PImage spectrum;

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
  
  // size(1280, 720);
  colorMode(RGB);
  background(52, 46, 61);

  // configure frame frameRate
  frameRate(30);

  // load font & image
  myFont = createFont("data/RobotoMono-Light.ttf", 32);
  spectrum = loadImage("data/spectrum.jpg");
  colors = new int [] {color(255, 20, 97), color(24, 255, 146), color(90, 135, 255), color(251, 243, 140)};

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

  if (!is_success) {
    colorMode(RGB);
    background(52, 46, 61);

    // draw spectrum image
    image(spectrum, 50, 20, 312, 80);

    smooth();
    drawPrompt();
    sample_shape.display();
    sound_shape.display();
    detectSound();
    checkEqual();
  }
  else {
    colorMode(HSB);
    background(sample_shape.hue);

    colorMode(RGB);
    fill(255, 255, 255, alpha);
    // text("Click to change shape", 10, 10, 70, 80);
    //fill(50);
    textFont(myFont);
    textSize(100);
    textAlign(CENTER);
    text("Success!", width/2, height/2);
    alpha += delta;
    if (alpha >= 255) {
      alpha = 1;
      is_success = false;
      reset();
    }
  }
  //println(voice_in.mix.level());
}

// testing
public void mousePressed() {
  //success();
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
  text("Click to change shape", width/2, height - 100);
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
    // println("hue match");

    if (abs(sound_shape.shape_width - sample_shape.shape_width*scale) < 20) {
      // println("both match");
      // change the color of the sample to green
      success();
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

public void success() {
  is_success = true;
  colors_index = round(random(0, 3));
  //reset();
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
static final int SATURATION = 150;
static final int BRIGHTNESS = 255;

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
//color [] colors = {color(255, 20, 97), color(24, 255, 146), color(90, 135, 255), color(251, 243, 140)};
final static int star_num = 50;

class Star {
  float radius;
  PVector position;
  PVector speed;

  Star() {
    position.x = random(50, width - 50);
    position.y =  random(50, height - 50);
  }

  // void display() {
  //   colorMode(RGB);
  //   for (int i = 0; i < star_num; i++) {
  //     fill(colors[round(random(0, 3))]);
  //     ellipse(position.x, position.y, radius, radius);
  //   }
  // }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "final_project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
