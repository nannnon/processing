ArrayList<MyWindmill> g_windmills = new ArrayList<MyWindmill>();
int g_counter = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  //final float Gap = 60;
  //int horNum = round(width / Gap) - 1;
  //int verNum = round(height / Gap) - 1;
  
  //for (int i = 0; i < horNum; ++i)
  //{
  //  for (int j = 0; j < verNum; ++j)
  //  {
  //    float x = i * Gap + Gap / 2 + 30;
  //    float y = j * Gap + Gap / 2 + 30;
  //    g_windmills.add(new MyWindmill(x, y));
  //  }
  //}
}

void draw()
{
  if (g_counter++ % 10 == 0)
  {
    g_windmills.add(new MyWindmill(random(width), random(height)));
  }
  
  background(0);
  for (MyWindmill w : g_windmills)
  {
    w.update();
    w.display();
  }
}
