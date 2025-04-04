float getRho(int x, int y)
{
  float rho = log(sqrt(pow(x - width/2, 2) + pow(y - height/2, 2)));
  if (rho < 0)
  {
    rho = 0;
  }
  return rho;
}

void applyInvLogPolarMapping(PImage img)
{
  img.loadPixels();

  final float maxRho = getRho(0, 0);
  
  loadPixels();
  for (int destY = 0; destY < height; ++destY)
  {
    for (int destX = 0; destX < width; ++destX)
    {
      float rho = getRho(destX, destY);
      float theta = atan2(destY - height/2, destX - width/2);
      
      int originX = round(rho / maxRho * (width - 1));
      int originY = round((theta + PI) / (2 * PI) * (height - 1));
      
      if (originX >= 0 && originX < width && originY >= 0 && originY < height)
      {
        int originIndex = originY * width + originX;
        int destIndex = destY * width + destX;
        pixels[destIndex] = img.pixels[originIndex];
      }
    }
  }
  updatePixels();
}

PImage g_canvas;
ArrayList<Rect> g_rects = new ArrayList<Rect>();
int g_counter = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  colorMode(HSB, 1, 1, 1);
  background(0);
  
  g_rects.add(new Rect(width / 2.0, height / 2.0));
  g_canvas = copy();
}

void draw()
{
  image(g_canvas, 0, 0);
  
  for (Rect r : g_rects)
  {
    r.update();
    r.display();
  }
  
  ++g_counter;
  if (g_counter % 10 == 0)
  {
    g_rects.add(new Rect(width / 2.0, height / 2.0));
  }
  
  g_canvas = copy();
  applyInvLogPolarMapping(g_canvas);
  
  saveFrame("frames/######.png");
}
