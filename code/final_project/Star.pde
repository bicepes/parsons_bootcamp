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
