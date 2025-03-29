ArrayList<Rect> g_rects = new ArrayList<Rect>();
int g_counter = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  colorMode(HSB, 1, 1, 1);
  background(0);
  
  g_rects.add(new Rect(width / 2.0, height / 2.0));
}

void draw()
{
  for (Rect r : g_rects)
  {
    r.update();
    r.display();
  }
  
  ++g_counter;
  if (g_counter % 100 == 0)
  {
    g_rects.add(new Rect(width / 2.0, height / 2.0));
  }
  
  //saveFrame("frames/######.png");
}
