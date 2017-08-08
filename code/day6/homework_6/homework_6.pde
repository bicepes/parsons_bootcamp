// Move element along a circle
// https://processing.org/discourse/beta/num_1264000877.html

int center_x;
int center_y;
float r_default;
float speed;
int size_default;
PVector[] pos = new PVector[1000];

void setup()
{
  center_x = width/2;
  center_y = height/2;
  r_default = 200;
  size_default = 2;

  for (int i = 0; i < 1000; i++) {
    pos[i] = new PVector(random(-2, 2), random(-2, 2));
  }

  size(1200, 800);
}

void draw()
{
  fill(0);
  rect(0, 0, width, height);

  for (int i = 0; i < 1000; i++) {

    float r = r_default;

    int size = (int)(size_default + random(0, 2));

    // millis()
    // https://processing.org/reference/millis_.html
    speed = millis()/1000.0;

    int x = (int)(center_x+r*cos(pos[i].x + speed));
    int y = (int)(center_y+r*sin(pos[i].y + speed));

    // int x = (int)(center_x+200*cos(pos[i].x));
    // int y = (int)(center_y+200*sin(pos[i].y));

    fill(255);
    ellipse(x, y, size, size);
  }

  // for (int i = 0; i < 500; i++) {
  //   speed = millis()/1000.0;
  //   //r += random(-5, 5);
  //   float incre = random(0, 50);
  //   incre += r;
  //
  //   int size = (int)(size_default + random(0, 2));
  //   int x = (int)(center_x+incre*cos(speed));
  //   int y = (int)(center_y+incre*sin(speed));
  //
  //   fill(255);
  //   ellipse(x, y, size, size);
  // }
}
