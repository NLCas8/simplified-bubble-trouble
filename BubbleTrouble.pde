// A simplified version of the game Bubble Trouble
// Shoot all the Balls without getting hit by one of them to win
// Move the Player left and right using 'a' and 'd', shoot a Missile using 'w'

// Our global variables and objects
int ballsCounter;    // Keep track of the amount of Balls in game
int minimumSize;     // The minimal size of a Ball
Ball[] balls;    // An array with Balls
Player player;
Missile missile;

void setup() { 
  size(800, 800); 
  smooth();
  frameRate(60);

  // Initialize our variables and objects
  ballsCounter = 0;
  minimumSize = 60;
  balls = new Ball[32];
  balls[0] = new Ball(width/2, 300, 256, 2);
  player = new Player();
  missile = new Missile(-100, -100);
} 

void draw() { 
  background(255); 

  // Run Ball objects
  for (int i = 0; i < balls.length; i++) {
    if (balls[i] != null) {
      balls[i].run();
      // If it has been shot -> delete it
      // Only spawn 2 new Balls if they are above the minimal size
      if (balls[i].isShot && ballsCounter < balls.length) {
        if (balls[i].w > minimumSize) {
          ballsCounter++;
          balls[ballsCounter] = new Ball(balls[i].xPos, balls[i].yPos, balls[i].w/3*2, 2);
          ballsCounter++;
          balls[ballsCounter] = new Ball(balls[i].xPos, balls[i].yPos, balls[i].w/3*2, -2);
        }
        // We 'delete' a Ball by setting the object to null
        balls[i] = null;
      }
    }
  }
  // Run the Player and Missile
  missile.run();
  player.run();
} 