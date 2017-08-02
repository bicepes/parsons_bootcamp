/***************************************/
      /*** Input Interations ***/
/***************************************/

// int value = 0;
//
// void setup() {
//   size(500,500);
//   colorMode(HSB);
// }
//
// void draw() {
//   if (mousePressed) {
//     fill(value, 255, 255);
//     ellipse(mouseX, mouseY, 30, 30);
//   }
//   //ellipse(xPosition,yPosition,100,100);
//   if (value < 255) {
//     value++;
//   }
//   else {
//     value = 0;
//   }
// }
//
// void keyPressed() {
//   if (keyPressed) {
//     println(key);
//     fill(255, 60, 40);
//     if (key == 'a') {
//       fill(255, 60, 40);
//       println("a pressed");
//     }
//     if (key == 'z') {
//       fill(40, 200, 15);
//       println("z pressed");
//     }
//   }
//   else {
//     fill(20, 60, 255);
//   }
// }

/***************************************/
        /*** Load Assets ***/
/***************************************/
PImage newschool;
PFont lato;

void setup() {
  size(700, 500);
  newschool = loadImage("newschool.jpg");
  lato = createFont("Lato-Regular.ttf", 24);
}

void draw() {
  image(newschool, 0, 0, width, height);
  textFont(lato, (40));
  fill(255, 30, 64);
  text("Hello!", random(700), random(500));
}
