// import Minim sound library
import ddf.minim.*;
import ddf.minim.analysis.*;

// global variables
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

void setup() {
  // canvas setup
  fullScreen();
  // size(1280, 720);
  colorMode(RGB);
  background(52, 46, 61);

  // configure frame frameRate
  frameRate(30);

  // load font & image
  myFont = createFont("data/RobotoMono-Light.ttf", 32);
  spectrum = loadImage("data/spectrum.png");

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

void draw() {

  if (!is_success) {
    colorMode(RGB);
    background(52, 46, 61);

    // draw spectrum image
    image(spectrum, 50, 20, 365, 153);

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
void mousePressed() {
  //success();
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
  text("Click to change shape", width/2, height - 100);
}

void detectSound() {
  // analyze current volume
  sound_volume = voice_in.mix.level() * 100;
  float volume_controller = sound_volume;
  scale = map(sound_volume, 0, 100.0, 0.1, 2.0);

  // analyze peak frequency
  fft.forward(voice_in.mix);
  for (int i=0; i < sampling_rate/2; i++) {
    float freq = fft.getFreq(float(i));
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
  hue = round(map(sound_frequency, 100, 600.0, 0, 255));
  hue = constrain(hue, 0, 255);
  // println("hue is " + hue + "\n");
  sound_shape.update(scale, hue);
  //println(sound_frequency);
}

void checkEqual() {
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

void success() {
  is_success = true;
  //reset();
}

void reset() {
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  hue = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, hue, true);
}
