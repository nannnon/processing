final float Gap = 128;
int horNum = 0;
int verNum = 0;

ArrayList<ArrayList<GridPoint>> g_points;
TargetPoint g_target;

void setup()
{
  // X→ Y↓
  size(2048, 1024, P2D);
  horNum = round(width / Gap);
  verNum = round(height / Gap);
  
  // ターゲット
  g_target = new TargetPoint();
  
  // 格子
  g_points = new ArrayList<ArrayList<GridPoint>>();
  for (int j = 0; j < verNum; ++j)
  {
    g_points.add(new ArrayList<GridPoint>());
    
    for (int i = 0; i < horNum; ++i)
    {
      g_points.get(j).add(new GridPoint(i, j));
    }
  }
}

void draw()
{
  background(0);
  
  for (int j = 0; j < verNum; ++j)
  {
    for (int i = 0; i < horNum; ++i)
    {
      g_points.get(j).get(i).display();
    }
  }
  
  g_target.update();
  g_target.display();
  
  saveFrame("frames/######.png");
}
