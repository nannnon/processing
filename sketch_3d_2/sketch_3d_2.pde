ArrayList<Rotating3DArc> g_arcs = new ArrayList<Rotating3DArc>();

void setup()
{
  // X← Y↓ Z↑
  size(1024, 1024, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  colorMode(HSB, 1, 1, 1);
  
  final int Num = 100;
  for (int i = 0; i <= Num; ++i)
  {
    float centerY = map(i, 0, Num, -100, 100);
    float outR = random(1, 100);
    float inR = random(0, outR - 1); 
    float start = random(0, 2 * PI);
    float end = random(start, 2 * PI);
    color c = color(random(1), 1, random(0.5, 1));
    float omega = random(PI / 1000, PI / 100);
    g_arcs.add(new Rotating3DArc(new PVector(0, centerY, 0), inR, outR, start, end, c, omega));
  }
}

void draw()
{
  camera(0, -100, -300, 0, 0, 0, 0, 1, 0);

  background(0);
  
  for (Rotating3DArc a : g_arcs)
  {
    a.display();
  }
  
  //saveFrame("frames/######.png");
}
