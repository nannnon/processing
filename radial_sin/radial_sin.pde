ArrayList<Sine> sines;

void setup()
{
  size(1024, 1024);
  
  sines = new ArrayList<Sine>();
  
  final int n = 200;
  for (int i = 0; i < n; ++i)
  {
    float theta = i * 2 * PI / n;
    
    final float r = 20;
    float x = r * cos(theta) + width / 2;
    float y = r * sin(theta) + height / 2;
    float dir = theta;
    colorMode(HSB, 1);
    color c = color(float(i) / float(n), 1, 1);
    sines.add(new Sine(x, y, dir, c));
  }
}

void draw()
{
  colorMode(RGB, 1);
  background(0);
  
  for (Sine s : sines)
  {
    s.update();
    s.display();
  }
  
  //saveFrame("######.png");
}
