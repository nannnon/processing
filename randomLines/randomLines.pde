final int XStep = 30;

void drawNoiseLine(float noiseOffset, int startX, int endX, int baseY, float rangeY, color c)
{
  stroke(c);
  
  float preX = startX;
  float preY = baseY;
  
  for (int x = startX; x < endX; x += XStep)
  {
    float y = noise(noiseOffset) * rangeY - rangeY / 2 + baseY;
    
    line(preX, preY, x, y);
    
    preX = x;
    preY = y;
    noiseOffset += 0.1;
  }
}

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  colorMode(HSB, 1, 1, 1, 1);
  
  background(0);
}

int g_endX = 0;
float g_noiseOffset = 0;

void draw()
{
  final int YStep = 10;
  for (int y = 0; y < height; y += YStep)
  {
    for (int i = 0; i < (YStep - 1); ++i)
    {
      drawNoiseLine(g_noiseOffset, 0, g_endX, y + i, 500, color(float(y) / height, 1, 1, 1));
    }
    
    drawNoiseLine(g_noiseOffset, 0, g_endX, y + YStep - 1, 500, color(0, 0, 0, 1));
  }
  
  if (g_endX > width)
  {
    g_endX = 0;
    g_noiseOffset = random(100);
  }
  else
  {
    g_endX += XStep / 2;
  }
  
  //saveFrame("frames/######.png");
}
