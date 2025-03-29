ArrayList<Prism> prisms = new ArrayList<Prism>();
final int Num = 20;
final float Scale = 1.1;
float t = 0;

void setup()
{
  // X← Y↓ Z↑
  size(2048, 2048, P3D);
  perspective(PI / 3, float(width) / float(height), 0.1, 1000);
  
  // 角柱追加
  for (int j = 0; j < Num; ++j)
  {
    for (int i = 0; i < Num; ++i)
    {
      float x = -Num * (Prism.Length + Prism.Gap) / 2 + i * (Prism.Length + Prism.Gap) + Prism.Gap;
      float z = -Num * (Prism.Length + Prism.Gap) / 2 + j * (Prism.Length + Prism.Gap) + Prism.Gap;
      prisms.add(new Prism(x, z));
    }
  }
}

void draw()
{
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  background(0);
  
  // カメラ
  float cameraY = -50 + t;
  float cameraZ = -50 + t;
  camera(0, cameraY, cameraZ, 0, 0, 0, 0, 1, 0);
  
  // 地面
  pushMatrix();
  fill(255, 255, 255);
  translate(0, 0, 0);
  box(Num * (Prism.Length + Prism.Gap) * Scale, 1, Num * (Prism.Length + Prism.Gap) * Scale);
  popMatrix();
  
  // 角柱
  t += 0.05;
  for (int j = 0; j < Num; ++j)
  {
    for (int i = 0; i < Num; ++i)
    {
      final float Omega = 0.1;
      float theta = t + i * Omega + j * Omega;
      float h = 10 * (sin(theta) + 1) + 2;
     
      int index = j * Num + i; 
      prisms.get(index).Update(h);
      prisms.get(index).Draw();
    }
  }
  
  saveFrame("frames/######.png");
}
