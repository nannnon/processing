ArrayList<Cube> cubes = new ArrayList<Cube>();
int counter = 0;

void setup()
{
  size(512, 512, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  camera(0, 0, Cube.r * 3, 0, 0, 0, 0, 1, 0);
  
  for (int i = 0; i < 3500; ++i)
  {
    if (i % 10 == 0)
    {
      cubes.add(new Cube());
    }
    
    for (Cube cube : cubes)
    {
      cube.update();
    }
  }
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  background(0);
  
  if (counter % 10 == 0)
  {
    cubes.add(new Cube());
  }
  
  for (int i = cubes.size() - 1; i >= 0; --i)
  {
    Cube cube = cubes.get(i);
    
    cube.update();
    boolean rm = cube.display();
    
    if (rm)
    {
      cubes.remove(i);
    }
  }
  
  ++counter;
  
  //saveFrame("frames/######.png");
}
