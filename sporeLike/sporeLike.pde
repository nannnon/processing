ArrayList<Primitive> g_primitives;

final PVector AreaSize = new PVector(1024, 1024);
final int Pri0Num = 50;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  g_primitives = new ArrayList<Primitive>();
  
  for (int i = 0; i < Pri0Num; ++i)
  {
    Pri0 p;
    do
    {
      float px = random(0, AreaSize.x);
      float py = random(0, AreaSize.y);
      float vx = random(-3, 3);
      float vy = random(-3, 3);
      p = new Pri0(new PVector(px, py), new PVector(vx, vy));
    }
    while (p.isHit());
    
    g_primitives.add(p);
  }
}

void draw()
{
  background(0);
  
  for (Primitive p : g_primitives)
  {
    p.update();
    p.display();
  }
  
  //saveFrame("frames/######.png");
}
