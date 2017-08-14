//Brightness Tracking
import processing.video.*;
Capture video;

void setup(){
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  noStroke();
  smooth();
}

void draw(){
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
