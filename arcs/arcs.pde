ArrayList<Arc> g_arcs = new ArrayList<Arc>();
color g_backgroundColor = color(0, 0, 0);

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  colorMode(HSB, 1, 1, 1);
  
  // Arc(float omega, float r0, float r1, int bandsNum)
  final int Num = 12;
  float r1 = width / 2;
  for (int i = 0; i < Num; ++i)
  {
    float omega = random(-PI/400, PI/400);
    float r0 = r1 - 30;
    int bandsNum = 5 * (Num - i);
    g_arcs.add(new Arc(omega, r0, r1, bandsNum));
    
    r1 = r0 - 10;
  }
}

void draw()
{
  background(g_backgroundColor);
  
  for (Arc a : g_arcs)
  {
    a.update();
    a.display();
  }
}
