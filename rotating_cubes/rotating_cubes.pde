ArrayList<Cube> cubes;

void setup()
{
  size(1024, 1024);
  
  cubes = new ArrayList<Cube>();
  float interval = Cube.cubeSize * Cube.maxScalingFactor;
  int hNum = ceil(width / interval);
  int vNum = ceil(height / interval);
  for (int i = 0; i < hNum; ++i)
  {
    for (int j = 0; j < vNum; ++j)
    {
      cubes.add(new Cube(i * interval, j * interval));
    }
  }
}

int counter = 0;

void draw()
{
  colorMode(RGB, 1);
  background(0);
  
  for (Cube cube : cubes)
  {
    cube.update();
    cube.display();
  }
  
  ++counter;
  if (counter % 50 == 0)
  {
    for (int i = 0; i < 10; ++i)
    {
      int t = floor(random(cubes.size()));
      cubes.get(t).startRotation();
    }
  }
  
  //saveFrame("######.png");
}
