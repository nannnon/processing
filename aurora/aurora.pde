ArrayList<MyAurora> g_auroras = new ArrayList<MyAurora>();
int g_counter = 0;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  colorMode(HSB, 1, 1, 1, 1);
  
  g_auroras.add(new MyAurora(64, 32, 384, 384, 0));
  g_auroras.add(new MyAurora(1024-64, 32, -384, 384, 0.2));
  g_auroras.add(new MyAurora(512-64, 512, -384, 384, 0.4));
  g_auroras.add(new MyAurora(512, 512, 384, 384, 0.6));
}

void draw()
{
  background(0);
  
  for (MyAurora a : g_auroras)
  {
    a.update(g_counter);
    a.display();
  }
  
  ++g_counter;
  
  //saveFrame("frames/######.png");
}
