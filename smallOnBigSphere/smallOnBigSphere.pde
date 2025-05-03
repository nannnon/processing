ArrayList<ArrayList<SmallSphere>> g_spheres = new ArrayList<ArrayList<SmallSphere>>();
ArrayList<Line> g_lines = new ArrayList<Line>();

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  
  final float ThetaStep = PI / 20;
  final float PhiStep = TWO_PI / 40;
  
  int i = 0;
  for (float theta = 0; theta <= PI; theta += ThetaStep, ++i)
  {
    g_spheres.add(new ArrayList<SmallSphere>());
    
    int j = 0;
    for (float phi = 0; phi <= TWO_PI; phi += PhiStep, ++j)
    {
      SmallSphere sphere = new SmallSphere(500, theta, phi);      
      g_spheres.get(i).add(sphere);
      
      // 縦線
      if (i > 0)
      {
        Line line = new Line(sphere, g_spheres.get(i - 1).get(j));
        g_lines.add(line);
      }
      // 横線
    }
  }
}

void draw()
{
  {
    float r = 1400;
    float theta = float(frameCount) / 100;
    float x = r * cos(theta);
    float z = r * sin(theta);
    
    camera(x, 0, z, 0, 0, 0, 0, 1, 0);
  }

  background(0);
  
  for (ArrayList<SmallSphere> s : g_spheres)
  {
    for (SmallSphere ss : s)
    {
      ss.display(); 
    }
  }
  
  for (Line l : g_lines)
  {
    l.display();
  }
  
  //saveFrame("frames/######.png");
}
