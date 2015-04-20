import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer background;

void setup()
{
  size(800, 800);
  minim = new Minim(this);
  background = minim.loadFile("background.mp3");
  background.loop();
  ship = new Ship();
  textSize(48); 
  ship1 = new Ship('W', 'A', 'D', 'F');
  ship1.position.x = 50;
  ast = new AIShip();
  ast.position.y = 100;
  ast1 = new AIShip();
  ast1.position.x = width - 100;
  
  for (int i = 0 ; i < numAsteroids ; i ++)
  {
   resetAsteroid(i); 
  }
}

int lives = 3;
int lives1 = 3;

int textH = 50;

boolean[] keys = new boolean[512];

Ship ship;
Ship ship1;
AIShip ast;
AIShip ast1;

float timeDelta = 1.0f / 60.0f;

int numAsteroids = 3;
float[] asteroidWidth = new float[numAsteroids];
float[] asteroidX = new float[numAsteroids];
float[] asteroidY = new float[numAsteroids];
float[] asteroidSpeed = new float[numAsteroids];

void asteroid()
{
  for( int i = 0; i < asteroidWidth.length ; i ++)
    {
     noFill();
     stroke(255, 255, 0);
     ellipse(asteroidX[i], asteroidY[i], asteroidWidth[i], asteroidWidth[i]);
     asteroidY[i] -= asteroidSpeed[i];
     asteroidX[i] -= asteroidSpeed[i];
    
    if (asteroidY[i] < (- asteroidWidth[i] / 2))
     {
      resetAsteroid(i);
     }  
     if (asteroidX[i] < (- asteroidWidth[i] / 2))
     {
      resetAsteroid(i);
     }  
}
}

void draw()
{
  lives();
  fill(0, 35);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(random(width), random(height), 2, 2);
  stroke(255, 0, 0);
  ship.update();
  ship.display();
  stroke(0, 255, 0);
  ship1.update();
  ship1.display();
  asteroid();
  ast.update();
  ast.asteroidDisplay();
  ast1.update();
  ast1.asteroidDisplay();
}


void resetAsteroid(int b)
{
 asteroidX[b] = random(0, width);
 asteroidY[b] = height;
 asteroidWidth[b] = random(50, 100);
 asteroidSpeed[b] = random (.1, 1.5); 
 
}

void lives()
{
  fill(255, 0, 0);
  text(lives, width - textH, textH);
  fill(0, 255, 0);
  text(lives1, textH/2, textH);
  
}

void keyPressed()
{
 keys[keyCode] = true; 
}

void keyReleased()
{
 keys[keyCode] = false; 
}
