// A Ball that falls by simulating some degree gravity
class Ball {

  float xPos, yPos;       // x and y location of the ball 
  float w;          // width of the ball
  float speedX, speedY;   // x and yspeed of the ball
  float gravity = 0.1;    // gravity variable
  boolean isShot;    // whether the ball has been shot by a missile

  // Ball constuctor with 4 parameters:
  // the x location, y location, width and horizontal speed
  Ball(float tempX, float tempY, float tempW, float tempSpeedX) {
    xPos = tempX;
    yPos = tempY;
    w = tempW;
    speedY = -5;
    speedX = tempSpeedX;
    isShot = false;
  }

  // Run this object
  void run() {
    display();
    update();
    hitPlayer();
    hitByMissile();
  }

  // Draw the Ball
  void display() {
    fill(30, 144, 255); 
    stroke(0); 
    ellipse(xPos, yPos, w, w);
  }

  void update() {
    // Add speedX and speedY to location
    yPos = yPos + speedY;
    xPos = xPos + speedX;
    // Add gravity to speedY
    speedY = speedY + gravity; 

    // If the ball reaches the bottom or one of the sides
    // Reverse speedY or speedX
    if (yPos > height - w/2) { 
      speedY = speedY * -0.95;
      yPos = height - w/2;
    }
    if (xPos > width - w/2 || xPos < w/2) {
      speedX = speedX * -1;
    }
  }

  // Check whether the Ball been hit by a Missile
  // (The collision detection is not very accurate, 
  // but it suffices for the purposes of this game)
  void hitByMissile() {
    if (missile.xPos>xPos-w/2 && missile.xPos<xPos+w/2 && missile.yPos<yPos+w/2 && missile.yPos>yPos-w/2) {
      isShot = true;
      missile.yPos = -100;
    }
  }

  // Check whether the Player has been hit by the Ball -> end the game
  // (Again, the collision detection is not very accurate, 
  // but it suffices for the purposes of this game)
  void hitPlayer() {
    if (player.xPos+player.w/2>xPos-w/2 && player.xPos+player.w/2<xPos+w/2 && player.yPos<yPos+w/2 && player.yPos>yPos-w/2) {
      noLoop();
    }
  }
}