//MOTION CAPTURE

import processing.video.*;
Capture video;
PImage prevFrame;

// How different must a pixel be to be a "motion" pixel
float threshold = 50;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height, 30);
  video.start();

  // Create an empty image the same size as the video
  prevFrame = createImage(video.width, video.height, RGB);
}

void captureEvent(Capture video) {

  // Save previous frame for motion detection!!
  prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); // Before we read the new frame, we always save the previous frame for comparison!
  prevFrame.updatePixels();  // Read image from the camera
  video.read();
}

void draw() {
  image(video, 0, 0);
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  float avgX = 0;
  float avgY = 0;
  int count = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;            // Step 1, what is the 1D pixel location
      color current = video.pixels[loc];      // Step 2, what is the current color
      color previous = prevFrame.pixels[loc]; // Step 3, what is the previous color

      // Step 4, compare colors (previous vs. current)
      float r1 = red(current);
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(previous);
      float g2 = green(previous);
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      if (diff > threshold) {
        // If motion, display black
        avgX += x;
        avgY += y;
        count++;
        //pixels[loc] = color(0); // PRINTS COLORS
      } else {
        // If not, display white
        //pixels[loc] = color(255); // PRINTS WHITE
      }
    }
  }
  //END OF LOOP OF EVERY PIXEL

  updatePixels();

  if (count > 0) {
    avgX = avgX /count;
    avgY = avgY /count;
    // Draw a circle at the tracked pixel
    fill(255,0,0);
    strokeWeight(4.0);
    stroke(0);
    //ellipse(avgX, avgY, 16, 16);
    println(avgX,avgY);
  }

  float pos1X = width/2+100;
  float pos1Y = height/2;

  float pos2X = width/2 - 100;
  float pos2Y = height/2;

  float radius = 50;
  float dist1 = dist(avgX,avgY,pos1X,pos1Y);
  float dist2 = dist(avgX,avgY,pos2X,pos2Y);

  if(dist1 < radius){
    fill(0,255,0);
    ellipse(pos1X,pos1Y,radius,radius);
  }else{
    fill(0,0,100);
    ellipse(pos1X,pos1Y,radius,radius);
  }

  if(dist2 < radius){
    fill(0,255,0);
    ellipse(pos2X,pos2Y,radius,radius);
  }else{
    fill(0,0,100);
    ellipse(pos2X,pos2Y,radius,radius);
  }
}
