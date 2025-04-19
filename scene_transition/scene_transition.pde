ArrayList<RotatingRectDisappearer> g_diss = new ArrayList<RotatingRectDisappearer>();
int g_index = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  {
    PImage img = loadImage("image.png");
    scale(width / img.width);
    image(img, 0, 0);
  }
  
  PImage img = copy();
  final int RectSize = 64;
  int horNum = width / RectSize;
  int verNum = height / RectSize;
  for (int y = 0; y < verNum; ++y)
  {
    for (int x = 0; x < horNum; ++x)
    {
      int x_ = x * RectSize;
      int y_ = y * RectSize;
      PImage subImg = img.get(x_, y_, RectSize, RectSize);
      g_diss.add(new RotatingRectDisappearer(x_, y_, subImg));
    }
  }
}

void draw()
{
  background(0);
  
  for (RotatingRectDisappearer d : g_diss)
  {
    d.display();
  }
  
  if (g_index < g_diss.size() && frameCount % 2 == 0)
  {
    g_diss.get(g_index).startDisappearing();
    ++g_index;
  }
  
  //saveFrame("frames/######.png");
}
