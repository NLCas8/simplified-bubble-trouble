// Only one Missile can be shot at a time by the Player
class Missile {

  float xPos, yPos;    // x and y location of the missile
  float w, h;          // Width and height of the missile
  float speed;         // Speed of the missile

  // Missile constructor with 2 parameters:
  // the x location and y location
  Missile(float tempX, float tempY) {
    xPos = tempX;
    yPos = tempY;
    speed = 15;
    w = 4;
    h = 16;
  }
  
  // Run this object
  void run() {
    update();
    display();
  }

  // Only update the location of the bullet if it is on screen
  void update() {
    if (yPos > -10) {
      yPos = yPos - speed;
    }
  }
  
  // Draw the Missile
  void display() {
    fill(100);
    rect(xPos+p.w/2, yPos, w, h);
  }
}