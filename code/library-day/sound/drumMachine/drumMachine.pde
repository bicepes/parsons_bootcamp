import ddf.minim.*;
Minim minim;
AudioSample kick;
AudioSample snare;
AudioSample hihat;
AudioSample hihatO;


void setup() {
  size(200, 200, P3D);

  minim = new Minim(this);

  kick = minim.loadSample( "kick.wav",512);
  snare = minim.loadSample("snare.wav");
  hihat = minim.loadSample("hihat.wav", 512);
  hihatO = minim.loadSample("hihato.wav", 512);
}

void draw() {
 
  
 
}


void keyPressed() {
  if (key == 's') {
    kick.trigger();
  }

  if (key == 'd') {
    snare.trigger();
  }

  if (key == 'j') {
    hihat.trigger();
  }

  if (key == 'k') {
    hihatO.trigger();
  }
}