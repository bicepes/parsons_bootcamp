void setup() {
  // image canvas 1090 x 755
  size(1090, 755);
}

void draw() {

  normalize_processing();

  // fill the background with color
  background(243, 226, 198);

  // draw shapes
  draw_circle_1();
  draw_circle_2();
  draw_triangle_2();
  draw_triangle_1();
  draw_arc_1();
}

// normalizing all styles settings
void normalize_processing() {
  stroke(0,0,0);
  strokeWeight(1);
}

// function for drawing top left circles
void draw_circle_1() {
  normalize_processing();

  // define group 1 centers
  int x = 275/2;
  int y = 275/2;

  // red circle
  noStroke();
  fill(206, 109, 81);
  ellipse(x,y,275,275);

  // red circle on the side
  stroke(46, 50, 24);
  fill(172, 29, 0);
  ellipse(209,258,85,85);

  // black circle
  stroke(155, 124, 114);
  fill(33, 26, 34);
  ellipse(x,y,220,220);

  // purple circle
  noStroke();
  fill(74, 38, 78);
  ellipse(x,y,105,105);
}

// function for drawing bottom left circles
void draw_circle_2() {
  normalize_processing();

  // define group 2 centers
  int x = 109;
  int y = 563;

  // blue circle
  noStroke();
  fill(165, 206, 208);
  ellipse(x,y,122,122);

  // yellow circle with stroke
  stroke(46, 50, 24);
  fill(231, 184, 57);
  ellipse(x,y,75,75);
}

// draw lines next to the top left circles
void draw_line_1() {
  normalize_processing();

  // normalizing stroke strokeWeight
  strokeWeight(1);

  //vertical line
  line(362,63,362,263);

  //first tilted line
  line(320,69,456,130);

  // second horizontal line
  line(330,132,400,132);

  // third horizontal line
  line(339,147,408,145);

  // fourth tilted line
  line(113,365,500,260);
}

// draw the heavy lines inside triangle 1
void draw_line_2() {
  normalize_processing();

  strokeWeight(4);

  // top black line
  line(345,463,670,400);

  // bottom red line
  stroke(127, 45, 36);
  line(328,508,630,420);
}

// draw the left triangle with elements inside
void draw_triangle_1() {
  normalize_processing();

  fill(165, 206, 208);
  triangle(137,431,363,186,720,508);

  draw_line_1();
  draw_line_2();
}

// draw the center arcs group
void draw_arc_1() {
  normalize_processing();

  // bottom line of the arc group
  strokeWeight(2);
  line(360,505,833,505);

  // center of the first arc
  int x = 505;
  int y = 505;
  int diameter = 94;

  // draw arcs from the left
  fill(255, 255, 255);
  arc(x,y,diameter,diameter,PI,2*PI,CHORD);
  arc(x+diameter,y,diameter,diameter,PI,2*PI,CHORD);
  arc(x+diameter*2,y,diameter,diameter,PI,2*PI,CHORD);
  arc(x+diameter*3,y,diameter,diameter,PI,2*PI,CHORD);
}

// draw the second triangle on the right
void draw_triangle_2() {
  normalize_processing();

  fill(255,255,255);
  triangle(520,505,647,7,791,505);
}
