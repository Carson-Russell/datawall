float rad = 10.0;
float speed = 1.5;
float paddle_speed = 5.0;

float ball_x,ball_y;

float p2_paddle_x, p2_paddle_y; 
float p1_paddle_x, p1_paddle_y;
float paddle_width = 3.0;
float paddle_height = 20.0;

boolean xhit = true;
boolean yhit = true;

void setup() {
  size(250, 200);
  
  //intialize ball_x and ball_y here
  ball_x = random(rad, width);
  ball_y = random(rad, height);
  
  //initialize the paddle positions
  p2_paddle_x = width-20; 
  p2_paddle_y = height/2; 
  
  p1_paddle_x = 15; 
  p1_paddle_y = height/2; 
}

void draw() {
  background(0);
  stroke(255);

  // switch directions based on it
  if(xhit){
    ball_x+=speed;
  } else {
    ball_x-=speed;
  }
  
  if(yhit){
    ball_y+=speed;
  } else {
    ball_y-=speed;
  }
  
  // test right/left wall hit
  if ( (ball_x + rad) > width || (ball_x - rad) < 0) {
    xhit = !xhit;
  }

  // test ceiling/floor hit
  if ( (ball_y + rad) > height || (ball_y - rad) < 0 ) {
   yhit = !yhit;
  } 
  
  // test left paddle hit
  if ( 
        (ball_x) > p1_paddle_x - paddle_width && 
        (ball_x) < p1_paddle_x + paddle_width &&
        (ball_y) < p1_paddle_y + paddle_height  &&
        (ball_y) > p1_paddle_y - paddle_height
      ){
     xhit = !xhit;
  }
  
  // test right paddle hit
  if ( 
        (ball_x) > p2_paddle_x - paddle_width && 
        (ball_x) < p2_paddle_x + paddle_width &&
        (ball_y) < p2_paddle_y + paddle_height  &&
        (ball_y) > p2_paddle_y - paddle_height
     ){
           xhit = !xhit;
  }
  
  //draw the ball
  ellipse(ball_x, ball_y, rad, rad);
  
  //draw the paddles
  rect(p1_paddle_x, p1_paddle_y, paddle_width, paddle_height);
  rect(p2_paddle_x, p2_paddle_y, paddle_width, paddle_height);
 

}

void keyPressed() {

    if (key == 'w') {
      p1_paddle_y -= paddle_speed;
    } else if (key == 's') {
      p1_paddle_y += paddle_speed;
    } 
    
    if (keyCode == UP) {
      p2_paddle_y -= paddle_speed;
    } else if (keyCode == DOWN) {
      p2_paddle_y += paddle_speed;
    } 
  
}

