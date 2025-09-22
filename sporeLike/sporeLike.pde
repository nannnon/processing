ArrayList<Primitive> g_primitives;
PVector g_areaSize;
float g_z;

final int Pri0Num = 150;
final int Pri1Num = 40;
final int Pri2Num = 20;
final int Pri3Num = 4;
final int Pri4Num = 2;
final int Pri5Num = 1;

void setup()
{
  // X→ Y↓
  size(1024, 1024, P3D);
  
  g_primitives = new ArrayList<Primitive>();
  g_areaSize = new PVector(4096, 4096);
  g_z = 100;
  
  // Pri4
  for (int i = 0; i < Pri4Num; ++i)
  {
    Primitive p;
    do
    {
      float px = random(0, g_areaSize.x);
      float py = random(0, g_areaSize.y);
      float vx = 0;
      float vy = 0;
      float da = 0;
      p = new Pri4(new PVector(px, py), new PVector(vx, vy), da);
    }
    while (p.isHit());
    
    g_primitives.add(p);
  }
  
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
      float da = 0;
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
  
  // 図形更新・描画
  for (Primitive p : g_primitives)
  {
    p.update();
    p.display();
  }
  
  // 領域の外縁を描画
  stroke(255, 255, 255);
  line(0, 0, g_areaSize.x, 0);
  line(g_areaSize.x, 0, g_areaSize.x, g_areaSize.y);
  line(g_areaSize.x, g_areaSize.y, 0, g_areaSize.y);
  line(0, g_areaSize.y, 0, 0);
  
  // カメラ設定
  final PVector CenterPos = new PVector(g_areaSize.x/2.0, g_areaSize.y/2.0);
  Primitive p = g_primitives.get(g_primitives.size() - 1);
  PVector priPos = new PVector(p.getPosition().x, p.getPosition().y);
  
  final float MaxZ = 2 * (height/2.0) / tan(PI*30.0 / 180.0);
  if (g_z < MaxZ)
  {
    g_z += 1;
  }
  //g_z = MaxZ;
  
  float ratio = 0;//g_z / MaxZ;
  PVector cameraPos = priPos.mult(1 - ratio).add( CenterPos.copy().mult(ratio) );
  
  camera(cameraPos.x, cameraPos.y, g_z, cameraPos.x, cameraPos.y, 0, 0, 1, 0);
  
  //saveFrame("frames/######.png");
}
