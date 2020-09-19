// Move the Player using 'a' and 'd', shoot using 'w'
class Player {

  float xPos, yPos;      // Location of the Player
  float w, h;      // Width and height of the Player

  // Player constructor
  Player() {
    xPos = width/2;
    yPos = height-40;
    w = 20;
    h = 40;
  }

  // Run this object
  void run() {
    display();
    border();
    movePlayer();
  }

  // Prevent Player from walking off screen
  void border() {    
    if (xPos > width-w) {
      xPos = width-w;
    } else if (xPos < 0) {
      xPos = 0;
    }
  }

  // Draw the Player
  void display() {
    fill(220, 20, 60);
    rect(xPos, yPos, w, h);
    ellipse(xPos+w/2, yPos, 30, 30);
  }

  // Handle keyboard input to move the player and shoot missiles
  void movePlayer() {
    if (keyPressed) {
      if ((key == 'w') || (key == 'W') || (key == UP)) {
        missile.xPos = player.xPos;
        missile.yPos = player.yPos;
      } else if ((key == 'a') || (key == 'A')) {
        player.xPos-=3;
      } else if ((key == 'd') || (key == 'D')) {
        player.xPos+=3;
      }
    }
  }
}