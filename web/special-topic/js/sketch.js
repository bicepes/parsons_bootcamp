/*** P5.play setup code to display a simple block ***/

// function setup() {
//   createCanvas(800,400);
// }
//
// function draw() {
//   background(255);
//   fill(0);
//   textAlign(CENTER);
//   text('Click to create a new sprite', width/2, height/2);
//   // http://p5play.molleindustria.org/docs/classes/p5.play.html#method-createSprite
//   drawSprites();
// }
//
// function mousePressed() {
//   var s = createSprite(mouseX, mouseY, 30, 30);
//
//   s.velocity.x = random(-5, 5);
//   s.velocity.y = random(-5, 5);
// }
var ghost;

function setup() {
  createCanvas(800,300);
  ghost = createSprite(400, 150, 50, 100);

  var myAnimation = ghost.addAnimation('floating', '../assets/ghost_standing0001.png', '../assets/ghost_standing0007.png');
  myAnimation.offY = 18;

  ghost.addAnimation('moving', '../assets/ghost_walk0001.png', '../assets/ghost_walk0004.png');
  ghost.addAnimation('spinning', '../assets/ghost_spin0001.png');
}

function draw() {
  background(255);

  if (mouseX < ghost.position.x - 10) {
    ghost.changeAnimation('moving');
    ghost.mirrorX(-1);
    ghost.velocity.x = -2;
  }
  else if (mouseX > ghost.position.x + 10) {
    ghost.changeAnimation('moving');
    ghost.mirrorX(1);
    ghost.velocity.x = 2;
  }
  else {
    ghost.changeAnimation('floating');
    ghost.velocity.x = 0;
  }

  if (mouseIsPressed) {
    ghost.rotation -= 10;
    ghost.changeAnimation('spinning');
  }
  else {
    ghost.rotation = 0;
  }

  if (keyIsDown(UP_ARROW)) {
    ghost.scale += 0.5;
  }
  else if (keyIsDown(DOWN_ARROW)){
    ghost.scale -= 0.5;
  }

  drawSprites();
}
