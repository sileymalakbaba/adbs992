
Ball[] balls;
 
 void setup()
 {
   size(400,400);
   balls =  new Ball[50];
   for (int i=0; i<balls.length; i++)
   {
     balls[i] = new Ball();
   }
 }
 
 void draw()
 {
   background(254, 244, 232);
   
   
   for(Ball ball : balls)
   {
     ball.draw();
 } 
     // check to see if the balls have collided
     for (int i=0; i<balls.length; i++)
     {
     //comparing with untested others.
      for (int j=i+1; j<balls.length; j++)
      {
      if (balls[i].hasCollidedWith(balls[j]))
        {
        balls[i].bounce(balls[j]);
        }
       }
     }
    
    for (Ball ball : balls)
    {
      ball.move(); 
    }
    
 }
