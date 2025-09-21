ArrayList<Primitive> g_primitives;
PVector g_areaSize;
float g_z;

final int Pri0Num = 150;
final int Pri1Num = 20;
final int Pri2Num = 10;
final int Pri3Num = 2;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P3D);
  
  g_primitives = new ArrayList<Primitive>();
  g_areaSize = new PVector(width, height);
  g_z = 100;
  
  // Pri3
  for (int i = 0; i < Pri3Num; ++i)
  {
    Primitive p;
    do
    {
      float px = random(0, g_areaSize.x);
      float py = random(0, g_areaSize.y);
      float vx = random(-1, 1);
      float vy = random(-1, 1);
      float da = random(-PI/40, PI/40);
      p = new Pri3(new PVector(px, py), new PVector(vx, vy), da);
    }
    while (p.isHit());
    
    g_primitives.add(p);
  }
  
  // Pri2
  for (int i = 0; i < Pri2Num; ++i)
  {
    Primitive p;
    do
    {
      float px = random(0, g_areaSize.x);
      float py = random(0, g_areaSize.y);
      float vx = random(-2, 2);
      float vy = random(-2, 2);
      float da = random(-PI/20, PI/20);
      p = new Pri2(new PVector(px, py), new PVector(vx, vy), da);
    }
    while (p.isHit());
    
    g_primitives.add(p);
  }
  
  // Pri1
  for (int i = 0; i < Pri1Num; ++i)
  {
    Primitive p;
    do
    {
      float px = random(0, g_areaSize.x);
      float py = random(0, g_areaSize.y);
      float vx = random(-3, 3);
      float vy = random(-3, 3);
      float da = random(-PI/10, PI/10);
      p = new Pri1(new PVector(px, py), new PVector(vx, vy), da);
    }
    while (p.isHit());
    
    g_primitives.add(p);
  }
  
  // Pri0
  for (int i = 0; i < Pri0Num; ++i)
  {
    Primitive p;
    do
    {
      float px = random(0, g_areaSize.x);
      float py = random(0, g_areaSize.y);
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
  
  Primitive p = g_primitives.get(g_primitives.size() - 1);
  PVector pos = p.getPosition();
  camera(pos.x, pos.y, g_z, pos.x, pos.y, 0, 0, 1, 0);
  
  final float MaxZ = (height/2.0) / tan(PI*30.0 / 180.0);
  if (g_z < MaxZ)
  {
    g_z += 1;
  }
  
  //saveFrame("frames/######.png");
}
