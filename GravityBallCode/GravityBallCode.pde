//declare variables
//float x[i], y[i], velX[i], velY[i], a, diam;

int count = 1;

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float [count];
float[] velY = new float [count];
float a;
float diam;

void setup() {
  //set size of canvas
  size(800, 600);
  background(0);

  //initialize variables
  for (int i = 0; i < count; i += 1) {
    x[i] = width/2;
    y[i] = height/2;
    diam = 40;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    a = 2;
  }
}

void draw() {
  //draw background to cover previous frame
  //background(0);

  int i = 0;

  while (i < count) {
    //draw ball
    ellipse(x[i], y[i], diam, diam);

    //add acceleration to velocity[i]
    velY[i] += a;

    //add velocity[i] to position
    x[i] += velX[i];
    y[i] += velY[i];

    //bounce ball if it hits walls
    if (x[i] + diam/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x[i] velocity[i] the negative version of itself
    } else if (x[i] - diam/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x[i] velocity[i] the positive version of itself
    }
    if (y[i] + diam/2 >= height) {
      y[i] = height - diam/2;
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam/2 <= 0) {
      velY[i] = abs(velY[i]);
    }

    //reset if click
    if (mousePressed) {
      x[i] = mouseX;
      y[i] = mouseY;
      velX[i] = random(-5, 5);
      velY[i] = random(-5, 5);
    }
    i += 1;
  }
}