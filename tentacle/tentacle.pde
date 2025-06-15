Branch g_tentacle;
float g_tentacleX;
float g_tentacleY;
float g_color; // 0～1
float g_deltaColor = 0.01;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  g_tentacleX = width / 2;
  g_tentacleY = height / 2;
  g_color = 0;
  g_tentacle = new Branch(0, g_tentacleX, g_tentacleY, 0, g_color);
}

void draw()
{
  background(255);
  
  g_color += g_deltaColor;
  if (g_color < 0 || g_color > 1)
  {
    g_color -= g_deltaColor;
    g_deltaColor *= -1;
  }
  
  g_tentacle.update(g_tentacleX, g_tentacleY, 0, g_color);
  g_tentacle.display();
}
