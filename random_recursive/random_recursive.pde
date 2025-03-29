ArrayList<Circle> g_circles = new ArrayList<Circle>();
ArrayList<PVector> g_linePos = new ArrayList<PVector>();
int g_counter = 0;

void init()
{
  g_circles.clear();
  g_linePos.clear();
  
  final int CirclesNum = 10;
  float r = width / 4.0; 
  for (int i = 0; i < CirclesNum; ++i)
  {
    boolean last = (i == CirclesNum - 1);
    if (i == 0)
    {
      g_circles.add(new Circle(null, r, last));
    }
    else
    {
      g_circles.add(new Circle(g_circles.get(i - 1), r, last));
    }
    r /= 1.5;
  }  
}

void setup()
{
  // X→ Y↓
  size(1024, 1024, P2D);
  
  init();
}

void draw()
{
  background(0);
  
  for (Circle c : g_circles)
  {
    c.update();
    c.display();
  }
  
  for (int i = 1; i < g_linePos.size(); ++i)
  {
    PVector preVec = g_linePos.get(i - 1);
    PVector curVec = g_linePos.get(i);
    
    noFill();
    stroke(color(255, 255, 0));
    line(preVec.x, preVec.y, curVec.x, curVec.y);
  }
  
  //if (g_linePos.size() > 400)
  //{
  //  g_linePos.remove(0);
  //}
  
  if (g_counter++ > 400)
  {
    g_counter = 0;
    init();
  }
  
  saveFrame("frames/######.png");
}
