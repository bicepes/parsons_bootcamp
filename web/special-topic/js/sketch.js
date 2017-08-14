function setup() {
  createCanvas(800,400);
}

function draw() {
  background(255);
  drawSprites();
}

function mousePressed() {
  var s = createSprite(mouseX, mouseY, 30, 30);

  s.velocity.x = random(-5, 5);
  s.velocity.y = random(-5, 5);
}
