import ddf.minim.*;

Minim minim;
AudioPlayer player;

float vol;
float pan;

void setup() {
  size(100, 100);
  minim = new Minim(this);

  player = minim.loadFile("1.mp3");
  player.play();
  player.loop(2);
}


void draw() {
  background(0);
  player.setGain(vol);
  player.setPan(pan);
}


void keyPressed() {
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
    pan -= 0.1;
  } else if (key == 'h') {
    pan += 0.1;
  } else if (key == 'j') {
    player.skip(-500);
  } else if (key == 'k') {
    player.skip(+500);
  }
}
