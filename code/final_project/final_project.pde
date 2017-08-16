// import Minim sound library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// muFont custom fonts
PFont myFont;

// shape global variables
Shape sample_shape;
Shape sound_shape;
int sample_width;
int sample_height;
int sample_color;
int sample_shape_code;

void setup() {
  // canvas setup
  fullScreen();
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
  sample_color = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, sample_color, true);
}

void draw() {
  colorMode(RGB);
  background(52, 46, 61);
  
  smooth();
  drawPrompt();
  sample_shape.display();
  sound_shape.display();
  sound_shape.update();
}

// testing
void mousePressed() {
  reset();
}

// help function to draw button
void drawPrompt() {
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

void reset() {
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  sample_color = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, sample_color, true);
}
