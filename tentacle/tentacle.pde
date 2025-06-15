Branch g_tentacle;
float g_tentacleX;
float g_tentacleY;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  g_tentacleX = width / 2;
  g_tentacleY = height / 2;
  g_tentacle = new Branch(0, g_tentacleX, g_tentacleY, 0);
}

void draw()
{
  background(255);
  g_tentacle.update(g_tentacleX, g_tentacleY, 0);
  g_tentacle.display();
  
  //saveFrame("frames/######.png");
}
