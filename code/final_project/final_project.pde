Shape sample_shape;
Shape sound_shape;
int sample_width;
int sample_height;

void setup() {
  fullScreen();
  colorMode(RGB);
  background(52, 46, 61);

  sample_shape = new Shape(0, false);
  sample_width = sample_shape.shape_width;
  sample_width = sample_shape.shape_height;

  sound_shape = new Shape(0, true);
}

void draw() {
  sample_shape.display();
  sound_shape.display();
}

// testing
void mousePressed() {
  colorMode(RGB);
  background(52, 46, 61);
  sample_shape = new Shape(0, false);
  sound_shape = new Shape(0, true);
}
