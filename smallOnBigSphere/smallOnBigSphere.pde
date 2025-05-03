ArrayList<ArrayList<SmallSphere>> g_spheres = new ArrayList<ArrayList<SmallSphere>>();
ArrayList<Line> g_lines = new ArrayList<Line>();
float g_noiseSeedX = random(10);
//float g_noiseSeedY = random(10);
final float BaseRadius = 500;

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  
  final float ThetaStep = PI / 20;
  final float PhiStep = TWO_PI / 40;
  
  int i = 0;
  for (float theta = 0; theta <= PI + 0.01; theta += ThetaStep, ++i)
  {
    g_spheres.add(new ArrayList<SmallSphere>());
    
    int j = 0;
    for (float phi = 0; phi <= TWO_PI; phi += PhiStep, ++j)
    {
      SmallSphere sphere = new SmallSphere(BaseRadius, theta, phi);      
      g_spheres.get(i).add(sphere);
      
      // 縦線
      if (i > 0)
      {
        Line line = new Line(sphere, g_spheres.get(i - 1).get(j));
        g_lines.add(line);
      }
      // 横線
      if (j > 0)
      {
        Line line = new Line(sphere, g_spheres.get(i).get(j - 1));
        g_lines.add(line);
      }
    }
    
    // 横線
    Line line = new Line(g_spheres.get(i).get(j - 1), g_spheres.get(i).get(0));
    g_lines.add(line);
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
  
  g_noiseSeedX += 0.01;
  //g_noiseSeedY += 0.01;
  
  for (int i = 0; i < g_spheres.size(); ++i)
  {
    for (int j = 0; j < g_spheres.get(i).size(); ++j)
    {
      //float r = BaseRadius + noise(g_noiseSeedX + i * 0.1, g_noiseSeedY + j * 0.1) * 500 - 250;
      float r = 2 * BaseRadius * noise(g_noiseSeedX + i * 0.1, 0);
      g_spheres.get(i).get(j).setRadius(r);
    }
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
