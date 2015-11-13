//declare variables
//float x[i], y[i], velX[i], velY[i], a, diam;

int count = 30;

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float [count];
float[] velY = new float [count];
float a;
float diam;
float b;
float db;

void setup() {
  //set size of canvas
  size(800, 600);
  background(0);
  frameRate(30);
  colorMode(HSB, width);
  b = 0;
  db = 5;

  //initialize variables
  for (int i = 0; i < count; i += 1) {
    x[i] = width/2;
    y[i] = height/2;
    diam = 40;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    a = 1;
  }
}

void draw() {
  //changing background
  background(b, b, b);
  b += db;
  if (b > width && b <= width + db){
    db *= -1;
  }
  if (b < 0 && b>= -db){
    db *= -1;
  }
  

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
    
    if (dist(mouseX, mouseY, x[i], y[i]) < diam/2) {
      velX[i] = 20;
      velY[i] = 20;
      fill(x[i], y[i], width);
    }

    //reset if click
    if (mousePressed) {
      x[i] = width/2;
      y[i] = height/2;
      velX[i] = random(-5, 5);
      velY[i] = random(-5, 5);
    }
    
    i += 1;
  }
}