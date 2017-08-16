static final int SATURATION = 200;
static final int BRIGHTNESS = 200;

class Shape {
  PVector position;

  // determine the geometry of the shape [0, 3], triangle, rectangle, square or circle
  int shape;
  int shape_width;
  int shape_height;
  float shape_scale;

  color hue;
  boolean sound_shape;

  Shape(int random_shape, boolean is_sound_shape) {
    shape = random_shape;
    sound_shape = is_sound_shape;
    shape_scale = 1;

    // set width and height of the shape
    switch(shape) {
      case 0:
        shape_width = round(random(30, 400));
        shape_height = round((shape_width/2)/sqrt(3)*3);
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
    hue = color(random(10, 250), SATURATION, BRIGHTNESS);

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
    shape_scale = 0.1;

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
    fill(0, 0, 0, 0.7);
    stroke(hue);
    strokeWeight(8);

    // set preferred geometry mode
    rectMode(CENTER);

    switch(shape) {
      case 0:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          triangle(
            0 - shape_width/2, 0 + shape_height/3,
            0, 0 - (shape_height*2)/3,
            0 + shape_width/2, 0 + shape_height/3
          );
          popMatrix();
        }
        else {
          triangle(
            position.x - shape_width/2, position.y + shape_height/3,
            position.x, position.y - (shape_height*2)/3,
            position.x + shape_width/2, position.y + shape_height/3
          );
        }
        break;
      case 1:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
      case 2:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
      case 3:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          ellipse(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          ellipse(position.x, position.y, shape_width, shape_height);
        }
        break;
      default:
        if (sound_shape) {
          pushMatrix();
          translate(position.x, position.y);
          scale(shape_scale);
          rect(0, 0, shape_width, shape_height);
          popMatrix();
        }
        else {
          rect(position.x, position.y, shape_width, shape_height);
        }
        break;
    }
  }

  void update(float sound_level, int sound_hue) {
    shape_scale = sound_level;
    colorMode(HSB);
    hue = color(sound_hue, SATURATION, BRIGHTNESS);
  }
}
