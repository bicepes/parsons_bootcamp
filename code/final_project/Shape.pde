class Shape {
  PVector position;

  // determine the geometry of the shape [0, 3], triangle, rectangle, square or circle
  int shape;
  int shape_width;
  int shape_height;

  color hue;
  boolean sound_shape;

  Shape(int random_shape, boolean is_sound_shape) {
    shape = random_shape;
    sound_shape = is_sound_shape;
    // set width and height of the shape
    switch(shape) {
      case 0:
        shape_width = int(random(10, 100));
        shape_height = int(random(10, 100));
        break;
      default:
        shape_width = 100;
        shape_height = 100;
        break;
    }

    colorMode(HSB);
    hue = color(random(0, 255), 100, 100);

    // set shape position
    if (sound_shape) {
      position = new PVector(width/2 + 200, height/2);
    }
    else {
      position = new PVector(width/2 - 200, height/2);
    }
  }


  Shape(int shape, int s_width, int s_height, color c, boolean is_sound_shape) {
    if (sound_shape) {
      position = new PVector(width/2 - 100, height/2);
    }
    else {
      position = new PVector(width/2 + 100, height/2);
    }
  }

  void display() {
    fill(0, 0, 0, 0);
    stroke(hue);

    switch(shape) {
      case 0:
        triangle(
          position.x - shape_width/2, position.y + shape_height/3,
          position.x, position.y - (shape_height*2)/3,
          position.x + shape_width/2, position.y + shape_height/3
        );
        break;
      default:
        rect(position.x - shape_width/2, position.y - shape_height, shape_width, shape_height);
        break;
    }
  }

  // void update(int scale) {
  //   position.add(velocity);
  // }
  //
  // // triangle(x1, y1, x2, y2, x3, y3)
  // // rect(): By default, the first two parameters set the location of the upper-left corner, the third sets the width, and the fourth sets the height
  // // ellipse(): By default, the first two parameters set the location, and the third and fourth parameters set the shape's width and height
  //
  // void display() {
  //   fill(hue);
  //   ellipse(position.x, position.y, radius*2, radius*2);
  // }
}
