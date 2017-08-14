import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

int num = 300;
PVector[] posArray = new PVector[num];
//int r = 100;
float pTime = 0;
float vel;
PVector[] noiseArray = new PVector[num];


void setup() {
  size(1000, 800, P3D);
  minim = new Minim(this);
  song = minim.loadFile("1.mp3", 512);
  song.loop();


  fft = new FFT(song.bufferSize(), song.sampleRate());

  for (int i = 0; i < num; i++) {
    float r = random(300,400);
    float theta = random(TWO_PI);
    float y = r*sin(theta);
    float x = r*cos(theta);

    noiseArray[i] = new PVector(x, y);
    posArray[i]  = new PVector(0, 0);
  }
}


void draw() {

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(1.3);
  fft.forward(song.mix);
  fill(255);
  stroke(255, 128);

  for (int i = 0; i < num; i++) {
    ellipse(posArray[i].x, posArray[i].y, 2, 2);
  }

  float dist = 50;

  for (int i = 0; i<num; i++) {
    for (int j = i+1; j<num; j++) {
      if (dist(posArray[i].x, posArray[i].y, posArray[j].x, posArray[j].y)<dist) {
        strokeWeight(1.2);
        line(posArray[i].x, posArray[i].y, posArray[j].x, posArray[j].y);
      }
    }
  }
  popMatrix();

  update();
}

void update() {

  float time = millis()*0.001;
  float dt = time - pTime;
  println(dt);
  pTime = time;

  float level = song.mix.level();
  float fftVal = fft.getBand(300);
  vel = map(fftVal, 0, 0.1, 0.05, 0.5);

  for (int i = 0; i < num; i++) {
    noiseArray[i].x += vel * dt;
    noiseArray[i].y += vel *dt;
    float xScale = map(noise(noiseArray[i].x), 0, 1, -1, 1);
    float yScale = map(noise(noiseArray[i].y), 0, 1, -1, 1);

    posArray[i].x = xScale * 300;
    posArray[i].y = yScale * 300;
  }
}
