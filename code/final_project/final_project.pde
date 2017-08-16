Shape sample_shape;
Shape sound_shape;
int sample_width;
int sample_height;
int sample_color;
int sample_shape_code;

void setup() {
  fullScreen();
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  sample_color = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, sample_color, true);
}

void draw() {
  smooth();
  sample_shape.display();
  sound_shape.display();
}

// testing
void mousePressed() {
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(round(random(0, 3)), false);

  sample_width = sample_shape.shape_width;
  sample_height = sample_shape.shape_height;
  sample_color = sample_shape.hue;
  sample_shape_code = sample_shape.shape;

  sound_shape = new Shape(sample_shape_code, sample_width, sample_height, sample_color, true);
}
