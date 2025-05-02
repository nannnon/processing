float g_noiseValueX;
float g_noiseValueY;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  g_noiseValueX = random(10);
  g_noiseValueY = random(10);
}

void draw()
{
  background(0);
  
  g_noiseValueY += 0.02;
  g_noiseValueX += 0.02;
  
  noFill();
  stroke(255);
  strokeWeight(3);
  
  final float Gap = 20;
  for (int y = 0; y < height; y += Gap)
  {
    for (int x = 0; x < width; x += Gap)
    {
      float noiseY = g_noiseValueY + y * 0.01;
      float noiseX = g_noiseValueX + x * 0.01;
      float n = noise(noiseX, noiseY);
      
      pushMatrix();
      translate(x, y);
      rotate(n * TWO_PI);
      line(0, 0, Gap / 2,0);
      popMatrix();
    }
  }
  
  //saveFrame("frames/######.png");
}
