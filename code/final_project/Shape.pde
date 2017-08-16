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
        shape_height = round(random(30, 400));
        shape_width= round((shape_height/3)*sqrt(3)*2);
        break;
      case 1:
        shape_width = round(random(30, 400));
        shape_height = round(random(50, 400));
        break;
      case 2:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
      case 3:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
      default:
        shape_width = round(random(30, 400));
        shape_height = shape_width;
        break;
    }

    colorMode(HSB);
    hue = color(random(0, 255), 200, 200);

    // set shape position
    if (sound_shape) {
      position = new PVector(width/2 + 275, height/2);
    }
    else {
      position = new PVector(width/2 - 275, height/2);
    }
  }

  Shape(int random_shape, int s_width, int s_height, color c, boolean is_sound_shape) {
    shape = random_shape;
    sound_shape = is_sound_shape;

    shape_width = s_width;
    shape_height = s_height;

    colorMode(HSB);
    hue = c;

    // set shape position
    if (sound_shape) {
      position = new PVector(width/2 + 275, height/2);
    }
    else {
      position = new PVector(width/2 - 275, height/2);
    }
  }

  void display() {
    fill(0, 0, 0, 0);
    stroke(hue);
    strokeWeight(8);

    // set preferred geometry mode
    rectMode(CENTER);

    switch(shape) {
      case 0:
        triangle(
          position.x - shape_width/2, position.y + shape_height/3,
          position.x, position.y - (shape_height*2)/3,
          position.x + shape_width/2, position.y + shape_height/3
        );
        break;
      case 1:
        rect(position.x, position.y, shape_width, shape_height);
        break;
      case 2:
        rect(position.x, position.y, shape_width, shape_height);
        break;
      case 3:
        ellipse(position.x, position.y, shape_width, shape_height);
        break;
      default:
        rect(position.x, position.y, shape_width, shape_height);
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
