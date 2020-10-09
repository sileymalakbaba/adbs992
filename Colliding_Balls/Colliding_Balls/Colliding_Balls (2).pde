class Ball
{
  float x, y;   // the position of the ball 
  float diameter; //ball size 
  float colour;   //colour of the ball
  float dx, dy; // movement
  //constructor - called whenever a new ball is created.
  Ball()
  {
    //initialise the states with the named variables.
   

    diameter = random(10, 40);
    x = random(diameter, width-diameter);
    y = random(diameter, height-diameter);
     colour = color(random(170, 250), random(70, 130), random(40, 80));
    dx = random(-2, 2);
    dy = random(-2, 2);
  }
  void draw()
  {

    fill(colour);

    ellipse(x, y, diameter, diameter);
  }
  void move()
  {
    if (x <= diameter/2) dx =abs (dx);
    if (y <= diameter/2) dy =abs (dy);
    if (x >= width-diameter/2) dx = -abs(dx);
    if (y >= height-diameter/2) dy = -abs(dy);
    x = x+dx;
    y = y+dy;
  }
  boolean hasCollidedWith(Ball anotherBall)
  {
    if (dist(x, y, anotherBall.x, anotherBall.y) <= (diameter+anotherBall.diameter)/2)
    {
      return true;
    }
    return false;
  }

  void bounce (Ball anotherBall)

  {
    //calculating the bouncing angle off 2 balls.

    float collisionAngle = atan2 (anotherBall.y-y, anotherBall.x-x);
    float collisionX = cos (collisionAngle);
    float collisionY = sin (collisionAngle);
    float collisionXTangent = cos (collisionAngle+HALF_PI);
    float collisionYTangent = sin (collisionAngle+HALF_PI);
    float collisionPx = x + diameter/2*collisionX;
    float collisionPy = y + diameter/2*collisionY;

    float v1 = sqrt (dx*dx + dy*dy);
    float v2 = sqrt(anotherBall.dx*anotherBall.dx+anotherBall.dy);

    float d1 = atan2(dy, dx);
    float d2 = atan2 (anotherBall.dy, anotherBall.dx);

    float v1x = v1*cos(d1-collisionAngle);
    float v1y = v1*sin(d2-collisionAngle);

    float v2x = v2*cos(d2-collisionAngle);
    float v2y = v2*sin(d2-collisionAngle);

    dx = collisionX*v2x + collisionXTangent*v1y;
    dy = collisionY*v2x + collisionYTangent+v1y;

    x = collisionPx - 0.5*diameter*collisionX;
    y = collisionPy - 0.5*diameter*collisionY;

    anotherBall.dx = collisionX*v1x + collisionXTangent+v2y;
    anotherBall.dy = collisionY*v1x + collisionYTangent+v2y;

    anotherBall.x = collisionPx + 0.5*anotherBall.diameter*collisionX;
    anotherBall.y = collisionPy + 0.5*anotherBall.diameter*collisionY;
  }
}
