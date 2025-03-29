ArrayList<Plane> planes = new ArrayList<Plane>();
int counter = 0;

void setup()
{
  size(2048, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  
  int horNum = 80;
  int verNum = 20;
  for (int x = 0; x < horNum; ++x)
  {
    for (int y = 0; y < verNum; ++y)
    {
      planes.add(new Plane(x * Plane.Width, y * Plane.Height));
    }
  }
  
  {
    float x = horNum * Plane.Width / 2.0;
    float y = verNum * Plane.Height / 2.0;
    camera(x, y, -30, x, y, 0, 0, 1, 0);
  }
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  background(0);
  
  for (Plane plane : planes)
  {
    plane.Update();
    plane.Draw();
  }
  
  ++counter;
  if (counter % 10 == 0)
  {
    int i = int(random(planes.size()));
    planes.get(i).StartRotating();
  }
  
  saveFrame("frames/######.png");
}
